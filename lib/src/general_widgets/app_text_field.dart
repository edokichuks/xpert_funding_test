// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_form_field/phone_form_field.dart';

// Project imports:
import 'package:xpert_funding_test/src/core/utils/app_utils_exports.dart';
import 'package:xpert_funding_test/src/general_widgets/general_widget_exports.dart';

class AppTextField extends StatefulWidget {
  final double? width, height;
  final double? labelSize, borderWidth;
  final String? hintText;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool? obscureText;
  final bool? enabled;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String text)? onSaved, onChange;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode, nextFocusNode;
  final VoidCallback? submitAction;
  final bool? enableErrorMessage;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon, prefixIcon, prefix, suffix;
  final Color? bordercolor, backgroundColor, labelColor, textColor;
  final bool? autofocus;
  final String? label;
  final EdgeInsetsGeometry? contentPadding;
  final String? firstLabel;
  final String? lastLabel;
  final List<TextInputFormatter>? inputFormatters;
  final bool isLoading, readOnly;
  final double borderRadius;
  final BorderRadius? borderRadiusGeometry;
  final BoxConstraints? constraints,
      prefixIconConstraints,
      suffixIconConstraints;
  final TextAlign? textAlign;
  final Key? fieldKey;

  final String? initialValue;

  const AppTextField({
    super.key,
    this.width,
    this.height,
    this.fieldKey,
    this.backgroundColor,
    this.isLoading = false,
    this.hintText,
    this.controller,
    this.minLines = 1,
    this.obscureText = false,
    this.enabled = true,
    this.validateFunction,
    this.onSaved,
    this.onChange,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocusNode,
    this.submitAction,
    this.enableErrorMessage = true,
    this.maxLines = 1,
    this.maxLength,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.bordercolor,
    this.autofocus,
    this.label,
    this.firstLabel,
    this.lastLabel,
    this.inputFormatters,
    this.borderRadius = 8,
    this.initialValue,
    this.labelSize,
    this.labelColor,
    this.onTap,
    this.textColor,
    this.borderWidth,
    this.contentPadding,
    this.constraints,
    this.textAlign,
    this.suffix,
    this.prefix,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.borderRadiusGeometry,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String? error;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;
    bool isLightMode = brightness == Brightness.light;
    return Container(
      width: widget.width,
      height: widget.height,
      constraints: widget.constraints,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            AppText(
              text: widget.label!,
              style: AppTextStyle.titleSmall.copyWith(
                color: widget.labelColor ?? AppColors.neutral100,
              ),
            ),
          if (widget.label != null) Spacing.height(3.h),
          TextFormField(
            maxLength: widget.maxLength,
            readOnly: widget.readOnly,
            inputFormatters: widget.inputFormatters,
            initialValue: widget.initialValue,
            textAlign: widget.textAlign ?? TextAlign.left,
            autofocus: widget.autofocus ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: widget.enabled,
            validator: widget.validateFunction != null
                ? widget.validateFunction!
                : (value) {
                    return null;
                  },
            onSaved: (val) {
              error = widget.validateFunction!(val);
              setState(() {});
              widget.onSaved!(val!);
            },
            onChanged: (val) {
              widget.validateFunction != null
                  ? error = widget.validateFunction!(val)
                  : error = null;
              setState(() {});
              if (widget.onChange != null) widget.onChange!(val);
            },
            onTap: widget.onTap,
            style: textTheme.titleSmall?.copyWith(
              color:
                  widget.textColor ??
                  (isLightMode ? AppColors.neutral500 : AppColors.neutral100),
            ),
            // cursorColor: isLightMode ? AppColors.darkBlue : AppColors.white,
            cursorColor: AppColors.neutral100,
            key: widget.fieldKey,
            maxLines: widget.maxLines,
            controller: widget.controller,
            obscureText: widget.obscureText!,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: InputDecoration(
              counter: null,
              counterText: "",
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              prefixIconConstraints: widget.prefixIconConstraints,
              suffixIconConstraints: widget.suffixIconConstraints,
              prefix: widget.prefix,
              suffix: widget.suffix,
              filled: true,
              enabled: false,
              contentPadding: widget.contentPadding,
              fillColor:
                  widget.backgroundColor ??
                  (isLightMode
                      ? AppColors.defaultBackgroundLight
                      : AppColors.defaultBackgroundDark),
              hintText: widget.hintText,
              hintStyle: AppTextStyle.titleSmall.copyWith(
                color: AppColors.neutral100,
              ),
              errorStyle: AppTextStyle.titleSmall.copyWith(
                color: AppColors.danger200,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius:
                    widget.borderRadiusGeometry ??
                    BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: AppColors.transparent, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    widget.borderRadiusGeometry ??
                    BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: AppColors.transparent, width: 1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius:
                    widget.borderRadiusGeometry ??
                    BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: AppColors.transparent,
                  width: widget.borderWidth ?? 0.5,
                ),
              ),
              labelStyle: TextStyle(color: AppColors.transparent),
              border: OutlineInputBorder(
                borderRadius:
                    widget.borderRadiusGeometry ??
                    BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.bordercolor ?? AppColors.transparent,
                  width: widget.borderWidth ?? 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    widget.borderRadiusGeometry ??
                    BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.bordercolor ?? AppColors.transparent,
                  width: widget.borderWidth ?? 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    widget.borderRadiusGeometry ??
                    BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.bordercolor ?? AppColors.primary300,
                  width: widget.borderWidth ?? 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppPinCodeField extends StatelessWidget {
  const AppPinCodeField({
    super.key,
    this.onComplete,
    required this.onChange,
    this.controller,
    this.obscureText,
    this.obscureCharacter,
    this.keyboardType,
    this.fieldBorderStyle,
    this.borderRadius,
    this.fieldBackgroundColor,
    this.activeBackgroundColor,
    this.length,
  });
  final Function(String pin)? onChange, onComplete;
  final TextEditingController? controller;
  final bool? obscureText;
  final String? obscureCharacter;
  final int? length;
  final TextInputType? keyboardType;
  final FieldBorderStyle? fieldBorderStyle;
  final BorderRadius? borderRadius;
  final Color? fieldBackgroundColor, activeBackgroundColor;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;
    bool isLightMode = brightness == Brightness.light;
    final color = isLightMode
        ? AppColors.defaultBackgroundLight
        : AppColors.defaultBackgroundDark;

    return PinCodeFields(
      length: length ?? 6,
      onComplete: onComplete ?? (pin) {},
      controller: controller,
      onChange: onChange,
      keyboardType: keyboardType ?? TextInputType.number,
      fieldBorderStyle: fieldBorderStyle ?? FieldBorderStyle.square,
      obscureCharacter: obscureCharacter ?? "⚫️",
      obscureText: obscureText ?? false,
      activeBorderColor: AppColors.primary300,
      activeBackgroundColor: activeBackgroundColor ?? color,
      fieldBackgroundColor: fieldBackgroundColor ?? color,
      borderWidth: 1.0,
      fieldWidth: 50,
      fieldHeight: 50,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      responsive: true,
      // textStyle: textTheme.titleSmall!.copyWith(
      //     fontWeight: FontWeight.w600,
      //     color: isLightMode ? AppColors.darkBlue : AppColors.white),
      textStyle: textTheme.titleSmall!.copyWith(
        color: (isLightMode ? AppColors.neutral500 : AppColors.neutral100),
      ),
      animation: Animations.grow,
    );
  }
}

class AppPhoneField extends StatelessWidget {
  const AppPhoneField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius = 16,
    this.backgroundColor,
    this.hintText,
    this.onChange,
    this.onSaved,
    this.autofocus = true,
    this.phoneController,
    required this.phoneFieldKey,
    this.countryButtonStyle,
    this.countrySelectorNavigator,
    this.showCountryCode,
  });
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double borderRadius;
  final bool autofocus;
  final bool? showCountryCode;
  final String? hintText;
  final Color? backgroundColor;
  final PhoneController? phoneController;
  final Function(PhoneNumber? phoneNumber, bool isValid)? onSaved, onChange;
  final GlobalKey<FormFieldState> phoneFieldKey;
  final CountryButtonStyle? countryButtonStyle;
  final CountrySelectorNavigator? countrySelectorNavigator;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isLightMode = brightness == Brightness.light;
    return PhoneFormField(
      key: phoneFieldKey,
      controller: phoneController,
      // cursorColor: (isLightMode ? AppColors.darkBlue : AppColors.gray100),
      cursorColor: AppColors.neutral500,
      initialValue: phoneController == null ? PhoneNumber.parse('+234') : null,
      validator: PhoneValidator.compose([
        PhoneValidator.required(context),
        PhoneValidator.validMobile(context),
      ]),
      countryButtonStyle: countryButtonStyle ?? const CountryButtonStyle(),
      countrySelectorNavigator:
          countrySelectorNavigator ??
          CountrySelectorNavigator.draggableBottomSheet(
            minChildSize: 0.4,
            maxChildSize: 0.8,
            initialChildSize: 0.5,
            showDialCode: showCountryCode ?? true,
          ),
      onChanged: (phone) {
        final isValid = phoneFieldKey.currentState!.isValid;
        onChange!(phone, isValid);
      },
      onSaved: (phone) {
        final isValid = phoneFieldKey.currentState!.isValid;
        onSaved!(phone, isValid);
      },
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        enabled: false,
        fillColor:
            backgroundColor ??
            (isLightMode
                ? AppColors.defaultBackgroundLight
                : AppColors.defaultBackgroundDark),
        hintText: hintText,
        hintStyle: AppTextStyle.titleSmall.copyWith(
          color: AppColors.neutral100,
        ),
        errorStyle: TextStyle(color: AppColors.danger200),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.danger100, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.danger100, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.transparent, width: 0.5),
        ),
        labelStyle: TextStyle(color: AppColors.transparent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.transparent, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.transparent, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.transparent, width: 1),
        ),
      ),
    );
  }
}
