import 'package:design_system/src/theme/theme.dart';
import 'package:flutter/material.dart';

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
        fillColor: SurfaceColor.foregroundColor,
        filled: true,
        focusColor: SurfaceColor.primaryPallete.shade800,
        suffixIcon: icon != null
            ? IconButton(
                icon: Icon(icon),
                onPressed: onIconTap,
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: SurfaceColor.primaryPallete.shade800),
          borderRadius: BorderRadius.circular(Spacing.xlarge),
        ),
      ),
    );
  }
}
