// Flutter imports:
import 'package:xpert_funding_test/l10n/l10n_exports.dart';
import 'package:xpert_funding_test/src/core/utils/app_utils_exports.dart';
import 'package:xpert_funding_test/src/general_widgets/faq_widget.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // _init();
  }

  // void _init() {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     var data = ref.read(userRepositoryProvider).getCurrentState();
  //     return switch (data) {
  //       CurrentState.loggedIn => context.replaceNamed(AppRouter.dashboard),
  //       CurrentState.onboarded => context.replaceNamed(AppRouter.login),
  //       _ => context.replaceNamed(AppRouter.onboarding)
  //     };
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary100, AppColors.neutral700],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.l10n.welcome(context.l10n.appName)),
            Text('PROD Template with theme setup and mutltilingual support'),
            Center(child: FlutterLogo(size: 100.r)),
            FaqWidget(
              title: 'What support does DitchRide provide to drivers?',
              faq:
                  'Booking is simple! Download our app, create an account, and search for available routes. Choose your preferred date, time, and destination, then confirm your booking.',
            ),
            FaqWidget(
              title: 'How much can I earn with DitchRide?',
              faq:
                  'Yes, you can cancel or reschedule your ride through the app. Please refer to our cancellation policy for details on refunds and rescheduling fees.',
            ),
          ],
        ),
      ),
    );
  }
}
