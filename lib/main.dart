// Flutter imports:

// Flutter imports:
import 'package:xpert_funding_test/l10n/arb/app_localizations.dart';
import 'package:xpert_funding_test/l10n/l10n_exports.dart';
import 'package:xpert_funding_test/src/core/config/exceptions/overall_app_error.dart';

import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:xpert_funding_test/firebase_options.dart';
import 'package:xpert_funding_test/src/core/device_features/device_feature_exports.dart';
import 'package:xpert_funding_test/src/core/helpers/helper_functions.dart';
import 'package:xpert_funding_test/src/core/router/router.dart';
import 'package:xpert_funding_test/src/core/services/local_storage.dart/local_storage_export.dart';
import 'package:xpert_funding_test/src/core/utils/app_utils_exports.dart';
import 'package:xpert_funding_test/src/core/utils/theme/theme_notifier/theme_notifier.dart';
import 'package:xpert_funding_test/src/general_widgets/general_widget_exports.dart';
import 'package:xpert_funding_test/src/core/device_features/device_feature_exports.dart';

// Add a navigator key to access navigation state globally
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@pragma("vm:entry-point")
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  DeviceNotification().firebaseInit();
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  await Hive.openBox(LocalStoreKeysManger.appBox.rawValue);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  AppErrorLog.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  final _controller = OverLayLoaderController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      DeviceNotification().firebaseInit(ref: ref);
      //!Question: Is the forgroundMessage method only for iOS?
      DeviceNotification().forgroundMessage();
      // final user = await UserStoreManager.getSavedUser();
      // if (user != null) {
      //   await UserStoreManager.saveUser(
      //       user: user.copyWith(isLoggedIn: false));
      // }
      if (mounted) HelperFunctions().activateTimer(dispose: false);
      // _activateTimer(dispose: false);
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _controller.dispose();
    HelperFunctions().activateTimer(dispose: true);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(themeProvider);
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) {
        return Listener(
          onPointerDown: (event) {},
          child: MaterialApp(
            navigatorKey: navigatorKey,
            title: context.l10n.appName, //'Clean Flutter App',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appTheme.themeMode,
            scrollBehavior: const ScrollBehavior().copyWith(
              physics: const BouncingScrollPhysics(),
            ),
            initialRoute: AppRouter.splashScreen,
            onGenerateRoute: AppRouter.onGenerateRoute, //!Localization setup
            /// Call the provideer to get the locale
            ///locale: viewModel.locale ?? const Locale('en'),
            locale: const Locale('en'),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              AppAndLocalizationDelegate(),
              AppIOSLocalizationDelegate(),
              AppWidgetLocalizationDelegate(),
            ],
          ),
        );
      },
    );
  }
}
