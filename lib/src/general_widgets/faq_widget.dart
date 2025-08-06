// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:xpert_funding_test/src/core/extensions/theme_extensions.dart';
import 'package:xpert_funding_test/src/general_widgets/general_widget_exports.dart';

// ignore: must_be_immutable
class FaqWidget extends StatefulWidget {
  FaqWidget({
    super.key,
    required this.title,
    required this.faq,
    this.isClicked = false,
  });
  final String title;
  // final String icon;
  final String faq;
  bool isClicked;

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isClicked = !widget.isClicked;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 280.w,
                  child: Text(
                    widget.title,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.isClicked = !widget.isClicked;
                    });
                  },
                  child: Icon(
                    widget.isClicked
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                ),
              ],
            ),
            Spacing.height(5),
            widget.isClicked == true
                ? Text(
                    widget.faq,
                    style: context.textTheme.bodyLarge!.copyWith(
                      fontSize: 12.sp,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
