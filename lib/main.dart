// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_preview/device_preview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:xpert_funding_test/src/core/config/exceptions/overall_app_error.dart';
import 'package:xpert_funding_test/src/core/helpers/helper_functions.dart';
import 'package:xpert_funding_test/src/core/router/router.dart';
import 'package:xpert_funding_test/src/core/services/local_storage.dart/local_storage_export.dart';
import 'package:xpert_funding_test/src/core/utils/app_utils_exports.dart';
import 'package:xpert_funding_test/src/core/utils/theme/theme_notifier/theme_notifier.dart';
import 'package:xpert_funding_test/src/general_widgets/general_widget_exports.dart';

// Add a navigator key to access navigation state globally
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  await Hive.openBox(LocalStoreKeysManger.appBox.rawValue);

  AppErrorLog.init();
  runApp(
    ProviderScope(
      child: DevicePreview(
        // enabled: kDebugMode,
        enabled: false,
        builder: (context) {
          return MyApp();
        },
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  final _controller = OverLayLoaderController();

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
            title: 'Expert Funding Test',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appTheme.themeMode,
            scrollBehavior: const ScrollBehavior().copyWith(
              physics: const BouncingScrollPhysics(),
            ),
            initialRoute: AppRouter.accountScreen,
            onGenerateRoute: AppRouter.onGenerateRoute,
          ),
        );
      },
    );
  }
}
