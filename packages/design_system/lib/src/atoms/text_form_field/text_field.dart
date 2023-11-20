import 'package:design_system/src/theme/theme.dart';
import 'package:flutter/material.dart';

part 'text_field_variant.dart';

class TextField extends StatelessWidget {
  const TextField({
    super.key,
    this.label,
    this.hint,
    this.icon,
    this.controller,
    this.onTap,
    this.onIconTap,
    this.obscureText,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.maxLength,
    this.style,
    this.textAlign,
    this.enabled,
    this.variant = TextFieldVariant.box,
  });
  final String? label;
  final String? hint;
  final IconData? icon;
  final VoidCallback? onIconTap;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final int? maxLength;
  final TextAlign? textAlign;
  final bool? enabled;
  final TextFieldVariant variant;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      onTap: onTap,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      style: style,
      maxLength: maxLength,
      textAlign: textAlign ?? TextAlign.start,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: Spacing.medium,
          right: Spacing.medium,
          top: Spacing.medium,
          bottom: Spacing.small,
        ),
        hintText: hint,
        labelText: label,
        fillColor: variant == TextFieldVariant.box
            ? SurfaceColor.foregroundColor
            : null,
        filled: variant == TextFieldVariant.box ? true : false,
        focusColor: SurfaceColor.primaryPallete.shade800,
        suffixIcon: icon != null
            ? IconButton(
                icon: Icon(
                  icon,
                  color: TextColor.special,
                ),
                onPressed: onIconTap,
              )
            : null,
        border: variant == TextFieldVariant.box
            ? OutlineInputBorder(
                borderSide:
                    BorderSide(color: SurfaceColor.primaryPallete.shade800),
                borderRadius: BorderRadius.circular(Spacing.xlarge),
              )
            : null,
      ),
    );
  }
}
