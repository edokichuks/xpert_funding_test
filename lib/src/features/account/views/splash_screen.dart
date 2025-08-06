// Flutter imports:
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 274.h,

                width: 343.w,
                padding: EdgeInsets.all(16.r),

                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  border: GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffFFFFFF).withValues(alpha: 0.3),
                        Color(0xffFFFFFF).withValues(alpha: 0.0),
                      ],
                    ),
                    width: 1.14,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff00000040).withValues(alpha: 0.25),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
