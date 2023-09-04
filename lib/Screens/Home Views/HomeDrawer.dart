import 'package:cliffordproperty/Helpers/Nav_Helper.dart';
import 'package:cliffordproperty/Screens/ContactUsScreen.dart';
import 'package:cliffordproperty/Screens/Home%20Views/ProfileView.dart';
import 'package:cliffordproperty/Screens/NotificationsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDrawer extends StatelessWidget with Nav_Helper {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadiusDirectional.horizontal(end: Radius.circular(16.r)),
      ),
      width: MediaQuery.of(context).size.width * .7,
      child: Column(
        children: [
          SizedBox(height: 60.h),
          Container(
            width: 120.w,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
                'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1985&q=80'),
          ),
          SizedBox(height: 8.h),
          Text(
            'Mona',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'mona12@gmai.com',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 64.h),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              GestureDetector(
                onTap: () {
                  jump(context, const ProfileView(cameFromDrawer: true));
                },
                child: ListTile(
                  leading: Image.asset('assets/images/Profile_Icon.png',
                      width: 32.w),
                  title: Text(
                    appLocale.profile,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Divider(
                indent: 17.w,
                endIndent: 28.w,
                thickness: 2.h,
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  jump(context, const NotificationsScreen());
                },
                child: ListTile(
                  leading: Image.asset('assets/images/Notification.png',
                      width: 32.w),
                  title: Text(
                    appLocale.notification,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Divider(
                indent: 17.w,
                endIndent: 28.w,
                thickness: 2.h,
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  jump(context, const ContactUsScreen());
                },
                child: ListTile(
                  leading:
                      Image.asset('assets/images/contact_us.png', width: 32.w),
                  title: Text(
                    appLocale.contactUs,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
