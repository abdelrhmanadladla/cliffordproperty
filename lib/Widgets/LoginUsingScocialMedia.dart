import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/SocialMediaButtonModel.dart';

class LoginUsingSocialMedia extends StatefulWidget {
  const LoginUsingSocialMedia({super.key});

  @override
  State<LoginUsingSocialMedia> createState() => _LoginUsingSocialMediaState();
}

class _LoginUsingSocialMediaState extends State<LoginUsingSocialMedia> {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  List<SocialMediaButtonModel> items = [
    SocialMediaButtonModel(
      image: 'whatsapp',
      onTap: () {},
    ),
    SocialMediaButtonModel(
      image: 'facebook',
      onTap: () {},
    ),
    SocialMediaButtonModel(
      image: 'instagram',
      onTap: () {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: <Widget>[
            const MyDivider(),
            Text(
              appLocale.or.toUpperCase(),
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
            const MyDivider(isFirst: false),
          ],
        ),
        SizedBox(height: 32.h),
        SizedBox(
          height: 44.h,
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SocialMediaButton(item: items[index]);
            },
            separatorBuilder: (context, index) => SizedBox(width: 8.w),
            itemCount: items.length,
          ),
        )
      ],
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.item,
  });

  final SocialMediaButtonModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 5.h),
        child: Image.asset('assets/images/${item.image}.png'),
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  final bool isFirst;
  const MyDivider({
    this.isFirst = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        color: Colors.black,
        thickness: 1.w,
        endIndent: isFirst ? 5.w : 16.w,
        indent: isFirst ? 16.w : 5.w,
      ),
    );
  }
}
