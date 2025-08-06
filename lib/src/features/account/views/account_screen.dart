// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:xpert_funding_test/src/core/utils/app_utils_exports.dart';
import 'package:xpert_funding_test/src/features/account/data/account_service.dart';
import 'package:xpert_funding_test/src/features/account/widgets/account_widget.dart';
import 'package:xpert_funding_test/src/general_widgets/faq_widget.dart';
import 'package:xpert_funding_test/src/general_widgets/general_widget_exports.dart';

// Project imports:

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
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
    final accounts = AccountService.getDummyAccounts();
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
              Spacing.heightL(),

              ...accounts.map((account) => AccountCard(account: account)),
            ],
          ),
        ),
      ),
    );
  }
}
