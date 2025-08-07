// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xpert_funding_test/src/core/utils/app_utils_exports.dart';

// Project imports:

extension WidgetExtension on Widget {
  Widget withContainer({
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxShape shape = BoxShape.rectangle,
    Color? color,
    BoxBorder? border,
    double? width,
    double? height,
    AlignmentGeometry? alignment,
  }) {
    return Container(
      alignment: alignment,
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        border: border,
        color: color,
        shape: shape,
        borderRadius: borderRadius,
      ),
      child: this,
    );
  }

  Widget withLoadingWidget({
    required bool isLoading,
    double height = 30,
    double width = 100,
    Color? color,
    EdgeInsetsGeometry? margin,
    Widget? loadingWidget,
  }) {
    return isLoading
        ? loadingWidget ??
              Container(
                margin: margin,
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: color ?? AppColors.neutral50,
                  borderRadius: BorderRadius.circular(5),
                ),
              )
        : this;
  }

  Widget withLoadingList({required bool isLoading, double height = 200}) {
    return isLoading
        ? ListView.separated(
            key: const ValueKey('loading'),
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                height: height,
                width: MediaQuery.sizeOf(context).width,
              );
            },
          )
        : this;
  }

  Widget withLoadingGrid({required bool isLoading}) {
    return isLoading
        ? GridView.count(
            key: const ValueKey('gridloading'),
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 2.6,
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              ...List.generate(
                6,
                (index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 56,
                  width: 150,
                ),
              ),
            ],
          )
        : this;
  }
}
