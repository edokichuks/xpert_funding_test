// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xpert_funding_test/src/core/utils/app_utils_exports.dart';

class AppRadio<T> extends StatelessWidget {
  const AppRadio({
    super.key,
    required this.value,
    this.groupValue,
    this.onRadioChanged,
    this.fillColor,
  });

  final T? value;
  final T? groupValue;
  final ValueChanged<T?>? onRadioChanged;
  final WidgetStatePropertyAll<Color?>? fillColor;

  @override
  Widget build(BuildContext context) {
    return Radio<T?>(
      value: value,
      groupValue: groupValue,
      onChanged: onRadioChanged,
      activeColor: AppColors.primary300,
      fillColor:
          fillColor ??
          WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary300;
            }
            return AppColors.neutral50;
          }),
    );
  }
}
