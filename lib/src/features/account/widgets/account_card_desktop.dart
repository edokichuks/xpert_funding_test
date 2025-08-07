// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// Project imports:
import 'package:xpert_funding_test/src/core/utils/app_utils_exports.dart';
import 'package:xpert_funding_test/src/features/account/domain/models/account_model.dart';
import 'package:xpert_funding_test/src/general_widgets/general_widget_exports.dart';

class AccountCardDesktop extends StatelessWidget {
  final AccountModel account;

  const AccountCardDesktop({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 632.w,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.topshadow),
          fit: BoxFit.cover,
        ),
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14.r),
        border: GradientBoxBorder(
          width: 1.14.r,
          gradient: LinearGradient(
            colors: [
              Color(0xffFFFFFF).withOpacity(0.3),
              Color(0xffFFFFFF).withOpacity(0.0),
            ],
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Badges
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title + PRO
                Row(
                  children: [
                    Text(
                      account.accountName ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacing.width(11),
                    if (account.isProAccount == true) ...[
                      SizedBox(width: 6.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(800.r),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff0249FE).withOpacity(0.3),
                              Color(0xff80A4FE).withOpacity(0.3),
                            ],
                          ),
                          border: GradientBoxBorder(
                            width: 1.14,
                            gradient: LinearGradient(
                              colors: [Color(0xff0249FE), Color(0xff80A4FE)],
                            ),
                          ),
                        ),
                        child: Transform.scale(
                          scale: 1.8,
                          child: AppImageView(
                            svgPath: AppImages.pro,
                            width: 24,
                            height: 17,

                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: account.currentPhase == 0
                        ? Color(0xff053321)
                        : Color(0xff11285F),
                    border: Border.all(
                      color: account.currentPhase == 0
                          ? Color(0xff75DFA7)
                          : Color(0xff80A4FE),
                    ),
                    borderRadius: BorderRadius.circular(1200.r),
                  ),
                  child: Text(
                    account.currentPhase == 0 ? "Funded" : "On Challenge",
                    style: TextStyle(
                      color: account.currentPhase == 0
                          ? Color(0xff75DFA7)
                          : Color(0xff80A4FE),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 8.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "\$${account.size?.toStringAsFixed(0) ?? '0'}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          SizedBox(height: 8.h),

          // Balance, Bought Date, ID
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              spacing: 12,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Balance : ',
                    children: [
                      TextSpan(
                        text: '\$${account.balance?.toStringAsFixed(0)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 17.sp,
                  ),
                ),
                Icon(
                  Icons.circle,
                  size: 10.r,
                  color: Colors.white.withOpacity(0.8),
                ),

                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Bought : ',
                        children: [
                          TextSpan(
                            text:
                                ' ${account.createdAt != null ? "${account.createdAt!.month}/${account.createdAt!.day}/${account.createdAt!.year}" : ''}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 17.sp,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),

                    Spacing.widthS(),
                    Icon(
                      Icons.info_outline,
                      color: Colors.white.withOpacity(0.3),
                      size: 20,
                    ),
                  ],
                ),
                Icon(
                  Icons.circle,
                  size: 10.r,
                  color: Colors.white.withOpacity(0.8),
                ),

                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'ID : ',
                        children: [
                          TextSpan(
                            text: ' ${account.id ?? ''}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 17.sp,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    Spacing.widthS(),
                    Icon(
                      Icons.info_outline,
                      color: Colors.white.withOpacity(0.3),
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 18.h),

          Container(
            // height: 60.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
            ),
            child: Row(
              spacing: 12.w,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _phaseBadge("Evaluation 1"),
                _phaseBadge("Evaluation 2"),
                _phaseBadge("Master Account", isMaster: true),
              ],
            ),
          ),

          SizedBox(height: 16.h),

          // Dashboard button
          Container(
            width: double.infinity,
            height: 48.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
              // gradient: LinearGradient(
              //   colors: [Colors.white, Color(0xffCCDBFF)],
              // ),
              border: GradientBoxBorder(
                gradient: LinearGradient(
                  colors: [Colors.white.withOpacity(0.2), Colors.white],
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImageView(
                  margin: EdgeInsets.only(top: 2),
                  height: 16,
                  width: 16,
                  svgPath: AppImages.dashboard,
                ),
                Spacing.widthS(),
                Text(
                  'Dashboard',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _phaseBadge(String text, {bool isMaster = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isMaster ? Color(0xff4652BB) : null,
        gradient: isMaster
            ? null
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff5865F2),
                  Color(0xff5865F2).withValues(alpha: 0.2),
                ],
              ),
        border: GradientBoxBorder(
          width: 1,
          gradient: LinearGradient(
            colors: [
              Color(0xff5865F2),
              Color(0xff5865F2).withValues(alpha: 0.2),
              Color(0xff5865F2).withValues(alpha: 0.2),
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          if (isMaster)
            AppImageView(svgPath: AppImages.lock, width: 16.r, height: 16.r)
          else
            AppImageView(
              svgPath: AppImages.evaluate,
              width: 16.r,
              height: 16.r,
            ),
          Spacing.width(6.w),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
