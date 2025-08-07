// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xpert_funding_test/src/core/helpers/helper_functions.dart';

// Project imports:
import 'package:xpert_funding_test/src/core/utils/app_utils_exports.dart';
import 'package:xpert_funding_test/src/features/account/data/account_service.dart';
import 'package:xpert_funding_test/src/features/account/widgets/account_card_desktop.dart';
import 'package:xpert_funding_test/src/features/account/widgets/account_card_mobile.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final bool desktop = HelperFunctions().isDesktop(context);
    final accounts = AccountService.getDummyAccounts();
    debugLog('is deskop => $desktop');
    return Scaffold(
      body: Container(
        height: height(context),
        width: width(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary100, AppColors.neutral700],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
          child: desktop
              ? Wrap(
                  spacing: 20.w,
                  runSpacing: 20.h,
                  children: accounts
                      .map((account) => AccountCardDesktop(account: account))
                      .toList(),
                )
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...accounts.map(
                      (account) => AccountCardMobile(account: account),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
