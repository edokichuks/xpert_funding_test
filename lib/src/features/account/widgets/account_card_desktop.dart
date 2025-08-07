// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
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
      width: 632,
      // height: 307,
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.topshadow),
          fit: BoxFit.cover,
        ),
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
        border: GradientBoxBorder(
          width: 1.14,
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
            padding: EdgeInsets.symmetric(horizontal: 16),
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
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacing.width(11),
                    if (account.isProAccount == true) ...[
                      SizedBox(width: 6),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(800),
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
                            height: 16,

                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: account.currentPhase == 0
                        ? Color(0xff053321)
                        : Color(0xff11285F),
                    border: Border.all(
                      color: account.currentPhase == 0
                          ? Color(0xff75DFA7)
                          : Color(0xff80A4FE),
                    ),
                    borderRadius: BorderRadius.circular(1200),
                  ),
                  child: Text(
                    account.currentPhase == 0 ? "Funded" : "On Challenge",
                    style: TextStyle(
                      color: account.currentPhase == 0
                          ? Color(0xff75DFA7)
                          : Color(0xff80A4FE),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 8),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "\$${account.size ?? '0'}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          SizedBox(height: 8),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              spacing: 8,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Balance : ',
                    children: [
                      TextSpan(
                        text: '\$${account.balance}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14,
                  ),
                ),
                Icon(
                  Icons.circle,
                  size: 8,
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
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),

                    Spacing.widthS(),
                    Icon(
                      Icons.info_outline,
                      color: Colors.white.withOpacity(0.3),
                      size: 14,
                    ),
                  ],
                ),
                Icon(
                  Icons.circle,
                  size: 8,
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
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    Spacing.widthS(),
                    Icon(
                      Icons.info_outline,
                      color: Colors.white.withOpacity(0.3),
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 18),

          Container(
            // height: 60,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
            ),
            child: Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _phaseBadge("Evaluation 1"),
                _phaseBadge("Evaluation 2"),
                _phaseBadge("Master Account", isMaster: true),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Dashboard button
          Container(
            width: double.infinity,
            height: 48,
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
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
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          if (isMaster)
            AppImageView(svgPath: AppImages.lock, width: 16, height: 16)
          else
            AppImageView(svgPath: AppImages.evaluate, width: 16, height: 16),
          Spacing.width(6),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
