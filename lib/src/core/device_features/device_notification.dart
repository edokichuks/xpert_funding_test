// Dart imports:
import 'dart:io';

// Package imports:
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeviceNotification {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future getNotificationToken() async {
    var token = await messaging.getToken();
    return token;
  }

  onTokenRefresh() {
    return "notifyToken";
  }

  requestNotificationPermisions() async {
    if (Platform.isIOS) {
      await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true,
      );
    }

    NotificationSettings notificationSettings = await messaging
        .requestPermission(
          alert: true,
          announcement: true,
          badge: true,
          carPlay: true,
          criticalAlert: true,
          provisional: true,
          sound: true,
        );
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      return true;
      // print('user is already granted permisions');
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      return true;
      // print('user is already granted provisional permisions');
    } else {
      //  print('User has denied permission');
      return false;
    }
  }

  // For IoS
  Future forgroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void firebaseInit({WidgetRef? ref}) {
    setupInteractMessage();
    // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((message) {
      // For IoS
      if (Platform.isIOS) {
        forgroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(message);
        showNotification(message);
      }
      //!This function should be dynamically passed
      // handleMesssage(message, ref: ref);
    });
  }

  void initLocalNotifications(RemoteMessage message) async {
    var androidInitSettings = const AndroidInitializationSettings(
      'ic_launcher',
    );
    var iosInitSettings = const DarwinInitializationSettings();

    var initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iosInitSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (payload) {
        //!This function should be dynamically passed
        // handleMesssage(message);
      },
    );
  }
  //!This function should not be here
  // handleMesssage(RemoteMessage message, {WidgetRef? ref}) {
  //   if (message.data['type'] == 'transactions') {
  //     ref?.read(dashboardProvider.notifier).getCurrentEarnings();
  //     // ref?.read(dashboardProvider.notifier).getTransactionHistory();
  //     // ref?.read(cardProvider.notifier).getCardTransaction();
  //   }
  //   // redirect to new screen or take different action based on payload that you receive.
  // }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
          message.notification!.android!.channelId.toString(),
          message.notification!.android!.channelId.toString(),
          importance: Importance.max,
          showBadge: true,
          playSound: true,
        );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          androidNotificationChannel.id.toString(),
          androidNotificationChannel.name.toString(),
          channelDescription: 'milarn',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          ticker: 'ticker',
          sound: androidNotificationChannel.sound,
        );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(androidNotificationChannel);

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
  }

  Future<void> setupInteractMessage() async {
    // when app is terminated
    RemoteMessage? initialMessage = await FirebaseMessaging.instance
        .getInitialMessage();

    if (initialMessage != null) {
      //!This function should be dynamically passed
      // handleMesssage(
      //   initialMessage,
      // );
    }

    //when app ins background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      //!This function should be dynamically passed
      // handleMesssage(
      //   event,
      // );
    });
  }

  Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
