import 'package:cliffordproperty/WIdgets/LoadingWidget.dart';
import 'package:cliffordproperty/WIdgets/MyTextFormFiled.dart';
import 'package:cliffordproperty/WIdgets/My_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  final _key = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _telephoneController;
  late TextEditingController _topicController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _telephoneController = TextEditingController();
    _topicController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _telephoneController.dispose();
    _topicController.dispose();
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 44.h),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios, size: 32.h),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      SizedBox(width: 74.w),
                      Text(
                        appLocale.connectWithUs,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(appLocale.name, style: _labelStyle),
                        SizedBox(height: 16.h),
                        MyTextFormField(
                          controller: _nameController,
                          filled: false,
                          border: const OutlineInputBorder(),
                          borderRadius: 5.r,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please enter a valid name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        Text(appLocale.email, style: _labelStyle),
                        SizedBox(height: 16.h),
                        MyTextFormField(
                          controller: _emailController,
                          filled: false,
                          border: const OutlineInputBorder(),
                          borderRadius: 5.r,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return appLocale.emailError;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        Text(appLocale.telephoneNumber, style: _labelStyle),
                        SizedBox(height: 16.h),
                        MyTextFormField(
                          controller: _telephoneController,
                          filled: false,
                          border: const OutlineInputBorder(),
                          borderRadius: 5.r,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a valid value';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        Text(appLocale.telephoneNumber, style: _labelStyle),
                        SizedBox(height: 16.h),
                        MyTextFormField(
                          controller: _emailController,
                          filled: false,
                          border: const OutlineInputBorder(),
                          borderRadius: 5.r,
                          maxLines: 5,
                          actionType: TextInputAction.done,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a valid message';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 50.h),
                        My_Button(
                          buttonText: appLocale.save,
                          onTap: _preformAction,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          loading ? const LoadingWidget() : const SizedBox.shrink()
        ],
      ),
    );
  }

  TextStyle get _labelStyle =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600);
  _preformAction() {
    if (_key.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      Future.delayed(
              const Duration(seconds: 2), () => setState(() => loading = false))
          .then((value) => Navigator.pop(context));
    }
  }
}
