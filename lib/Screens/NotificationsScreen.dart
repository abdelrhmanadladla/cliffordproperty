import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 32.h),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, size: 32.h),
                  onPressed: () => Navigator.pop(context),
                ),
                SizedBox(width: 80.w),
                Text(
                  appLocale.notification,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),

            ///TODO: Add Stream builder
            SizedBox(height: 80.h),
            SvgPicture.asset('assets/images/Notification.svg'),
            SizedBox(height: 32.h),
            Text(
              appLocale.noData,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
