import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MySearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String value)? onChange;
  final Function(String value)? onSubmit;
  const MySearchBar({this.onChange, this.onSubmit, this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        onSubmitted: onSubmit,
        decoration: InputDecoration(
          filled: true,
          hintText: appLocale.searchHint,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset('assets/images/Voice.svg'),
              SizedBox(width: 8.w),
              SvgPicture.asset('assets/images/Filter.svg'),
              SizedBox(width: 8.w),
            ],
          ),
          prefixIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: SvgPicture.asset('assets/images/search_icon.svg')),
          fillColor: const Color(0xffF1F1F2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
