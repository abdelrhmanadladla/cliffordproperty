import 'dart:async';

import 'package:cliffordproperty/Helpers/Nav_Helper.dart';
import 'package:cliffordproperty/Screens/auth/Reset%20Password/ResetPassowrd.dart';
import 'package:cliffordproperty/WIdgets/My_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReceiveOTP extends StatefulWidget {
  const ReceiveOTP({super.key});

  @override
  State<ReceiveOTP> createState() => _ReceiveOTPState();
}

class _ReceiveOTPState extends State<ReceiveOTP> with Nav_Helper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  int otpCount = 0;
  late Timer _timer;
  int counter = 59;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (counter == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            counter--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 32.w,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(height: 8.h),
            Center(
              child: SvgPicture.asset('assets/images/enter_otp.svg'),
            ),
            SizedBox(height: 16.h),
            Text(appLocale.enterVerification,
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 12.h),
            Text(appLocale.pleaseCheckYourEmail,
                style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return Container(
                  alignment: Alignment.center,
                  width: 76.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        FocusScope.of(context).nextFocus();
                        setState(() {
                          otpCount++;
                        });
                      } else {
                        FocusScope.of(context).previousFocus();
                        setState(() {
                          otpCount--;
                        });
                      }
                    },
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 50.h),
            My_Button(
              buttonText: appLocale.verify,
              enabled: otpCount == 4,
              onTap: () {
                jump(context, const ResetPassword(), replace: true);
              },
            ),
            SizedBox(height: 24.h),
            counter != 0
                ? Center(
                    child: Text(
                      appLocale.didNotReceiveCode,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  )
                : const SizedBox.shrink(),
            SizedBox(height: 8.h),
            counter != 0
                ? Center(
                    child: Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: appLocale.resendIn,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '00:${counter < 10 ? '0' : ''}$counter ',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            counter == 0
                ? Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          counter = 59;
                          startTimer();
                        });
                      },
                      child: Text(
                        appLocale.resendOTP,
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
