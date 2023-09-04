import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final String? errorMessage;
  final String? Function(String? value)? validator;
  final bool filled;
  final double borderRadius;
  final bool isObscure;
  final TextInputType? keyboardType;
  final OutlineInputBorder? border;
  final Widget? suffix;
  final String? prefix;
  final int? maxLines;
  final OutlineInputBorder? focusBorder;
  final TextInputAction actionType;
  final Function(String value)? onSubmit;
  final Function(String value)? onChange;
  const MyTextFormField({
    this.onChange,
    this.maxLines,
    this.onSubmit,
    super.key,
    this.actionType = TextInputAction.next,
    this.prefix,
    this.keyboardType,
    required this.controller,
    this.hint,
    this.suffix,
    this.validator,
    this.errorMessage,
    this.isObscure = false,
    this.filled = true,
    this.borderRadius = 8,
    this.border,
    this.focusBorder,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      obscureText: isObscure,
      keyboardType: keyboardType,
      textInputAction: actionType,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        suffixIcon: suffix,
        prefixIcon: prefix == null
            ? null
            : Padding(
                padding: EdgeInsetsDirectional.only(
                    top: 4.h, bottom: 4.h, start: 16.w, end: 4.w),
                child: SvgPicture.asset(
                  'assets/images/$prefix.svg',
                  height: 24.h,
                  width: 24.w,
                ),
              ),
        filled: filled,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade600),
        errorText: errorMessage,
        enabledBorder: border,
        focusedBorder: focusBorder,
        fillColor: Theme.of(context).colorScheme.surface.withOpacity(.1),
        border: border ??
            OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius.r),
            ),
      ),
      validator: validator,
    );
  }
}
