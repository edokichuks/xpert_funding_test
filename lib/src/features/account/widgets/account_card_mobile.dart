// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// Project imports:
import 'package:xpert_funding_test/src/core/utils/app_utils_exports.dart';
import 'package:xpert_funding_test/src/features/account/domain/models/account_model.dart';
import 'package:xpert_funding_test/src/general_widgets/general_widget_exports.dart';

class AccountCardMobile extends StatelessWidget {
  final AccountModel account;

  const AccountCardMobile({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.topshadow),
          fit: BoxFit.cover,
        ),
        color: Colors.white.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(14.r),
        border: GradientBoxBorder(
          width: 1.14.r,
          gradient: LinearGradient(
            colors: [
              Color(0xffFFFFFF).withValues(alpha: 0.3),
              Color(0xffFFFFFF).withValues(alpha: 0.0),
            ],
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Badges
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: account.currentPhase == 0
                      ? Color(0xff053321)
                      : Color(0xff11285F),
                  border: Border.all(
                    color: account.currentPhase == 0
                        ? Color(0xff75DFA7)
                        : Color(0xff80A4FE),
                  ),
                  borderRadius: BorderRadius.circular(12.r),
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
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: account.currentPhase == 0 ? Color(0xff4652BB) : null,
                  gradient: account.currentPhase == 0
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
                    AppImageView(
                      svgPath: account.currentPhase == 0
                          ? AppImages.lock
                          : AppImages.evaluate,
                      width: 13.r,
                      height: 13.r,
                    ),
                    Spacing.width(6.w),
                    Text(
                      account.currentPhase == 0
                          ? "Master Account"
                          : "Evaluation 1",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

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
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff0249FE).withValues(alpha: 0.3),
                        Color(0xff80A4FE).withValues(alpha: 0.3),
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

          SizedBox(height: 8.h),

          Text(
            "\$${account.size?.toStringAsFixed(0) ?? '0'}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w800,
            ),
          ),

          SizedBox(height: 16.h),

          Text.rich(
            TextSpan(
              text: 'Balance :',
              children: [
                TextSpan(
                  text: ' \$${account.balance?.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.6),
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacing.heightS(),

          Row(
            children: [
              Text.rich(
                TextSpan(
                  text: 'Bought :',
                  children: [
                    TextSpan(
                      text:
                          ' ${account.createdAt != null ? "${account.createdAt!.month}/${account.createdAt!.day}/${account.createdAt!.year}" : ''}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),

              Spacing.widthXS(),
              Icon(
                Icons.info_outline,
                color: Colors.white.withOpacity(0.3),
                size: 20,
              ),
            ],
          ),
          Spacing.heightS(),

          Row(
            children: [
              Text.rich(
                TextSpan(
                  text: 'ID :',
                  children: [
                    TextSpan(
                      text: ' ${account.id ?? ''}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacing.widthXS(),
              Icon(
                Icons.info_outline,
                color: Colors.white.withOpacity(0.3),
                size: 20,
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Dashboard button
          Container(
            width: 311.w,
            height: 32.h,

            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
              gradient: LinearGradient(
                colors: [Colors.white, Color(0xffCCDBFF)],
              ),
              border: GradientBoxBorder(
                gradient: LinearGradient(
                  colors: [Colors.white.withOpacity(0.2), Colors.white],
                ),
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppImageView(
                  margin: EdgeInsets.only(top: 2),
                  height: 14,
                  width: 14,
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
}
