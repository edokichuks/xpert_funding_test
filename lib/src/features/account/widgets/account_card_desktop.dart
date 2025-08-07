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
      width: 500.w, // Desktop wider card
      padding: EdgeInsets.all(16.r),
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

          // Balance, Bought Date, ID
          Text.rich(
            TextSpan(
              text: 'Balance : ',
              children: [
                TextSpan(
                  text: '\$${account.balance?.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            style: TextStyle(color: Colors.white.withOpacity(0.6)),
          ),

          SizedBox(height: 6.h),

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
                  ),
                ),
              ],
            ),
            style: TextStyle(color: Colors.white.withOpacity(0.6)),
          ),

          SizedBox(height: 6.h),

          Text.rich(
            TextSpan(
              text: 'ID : ',
              children: [
                TextSpan(
                  text: ' ${account.id ?? ''}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            style: TextStyle(color: Colors.white.withOpacity(0.6)),
          ),

          SizedBox(height: 16.h),

          // Phase Badges - Desktop only
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _phaseBadge("Evaluation 1"),
              _phaseBadge("Evaluation 2"),
              _phaseBadge("Master Account", isMaster: true),
            ],
          ),

          SizedBox(height: 16.h),

          // Dashboard button
          Container(
            width: double.infinity,
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

  Widget _phaseBadge(String text, {bool isMaster = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isMaster
            ? Color(0xff5865F2).withOpacity(0.2)
            : Color(0xff11285F),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          if (isMaster)
            AppImageView(svgPath: AppImages.lock, width: 13.r, height: 13.r)
          else
            AppImageView(
              svgPath: AppImages.evaluate,
              width: 13.r,
              height: 13.r,
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
