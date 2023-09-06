import 'package:cliffordproperty/Helpers/Nav_Helper.dart';
import 'package:cliffordproperty/Screens/auth/Reset%20Password/ReceiveOTP.dart';
import 'package:cliffordproperty/Widgets/LoadingWidget.dart';
import 'package:cliffordproperty/Widgets/My_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Widgets/MyTextFormFiled.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> with Nav_Helper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  late TextEditingController _emailController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  bool isLoading = false;

  String errorMsg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 20.h),
            shrinkWrap: true,
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, size: 32.h),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/images/forgot_password.svg',
                  width: 270.w,
                ),
              ),
              SizedBox(height: 12.h),
              Text(appLocale.forgotPassword,
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 12.h),
              Text(appLocale.enterYourEmail,
                  style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 24.h),
              Text(
                appLocale.email,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(height: 6.h),
              MyTextFormField(
                prefix: 'email_icon',
                hint: appLocale.emailHint,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                actionType: TextInputAction.done,
                errorMessage: errorMsg,
                onSubmit: (value) {
                  preformAction();
                },
              ),
              SizedBox(height: 60.h),
              My_Button(
                  buttonText: appLocale.sendVerification, onTap: preformAction),
            ],
          ),
          isLoading ? const LoadingWidget() : const SizedBox.shrink(),
        ],
      ),
    );
  }

  preformAction() {
    if (_emailController.text.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(_emailController.text)) {
      setState(() {
        errorMsg = appLocale.emailError;
      });
    } else {
      setState(() {
        errorMsg = '';
      });
      setState(() {
        isLoading = true;
      });
      Future.delayed(
        const Duration(seconds: 2),
        () {
          setState(() {
            isLoading = false;
          });
        },
      ).then((value) => jump(context, const ReceiveOTP(), replace: true));
    }
  }
}
