// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:xpert_funding_test/src/features/account/views/splash_screen.dart';

// Project imports:


class AppRouter {
  static const String login = '/login';
  static const String splashScreen = '/';
  static const String bottomNavBar = '/bottomNavBar';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //SPLASHSCREEN
      case splashScreen:
        return _trasnsitionRouter(screenWidget: const SplashScreen());
      // case confirmTranscriptionPinScreen:
      //   final transactionPin = settings.arguments as ConfrimTransactionPinModel;
      //   return _trasnsitionRouter(
      //       screenWidget:
      //           ConfirmTranscriptionpinScreen(transactionPin: transactionPin));

      default:
        throw UnimplementedError('Route not found');
    }
  }
}

_trasnsitionRouter({
  required Widget screenWidget,
  bool fullscreenDialog = false,
}) {
  return CupertinoPageRoute(
    fullscreenDialog: fullscreenDialog,
    builder: (context) => screenWidget,
  );
}
