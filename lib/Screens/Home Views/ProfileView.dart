import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliffordproperty/Widgets/LoadingWidget.dart';
import 'package:cliffordproperty/Widgets/MyTextFormFiled.dart';
import 'package:cliffordproperty/Widgets/My_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatefulWidget {
  final bool cameFromDrawer;
  const ProfileView({this.cameFromDrawer = false, super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  final _key = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _telephoneController;
  late TextEditingController _cityController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: 'a@a.com');
    _nameController = TextEditingController(text: 'Ahmed');
    _telephoneController = TextEditingController(text: '123456789');
    _cityController = TextEditingController(text: 'Gaza');
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _telephoneController.dispose();
    _cityController.dispose();
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 44.h),
                  Row(
                    children: <Widget>[
                      widget.cameFromDrawer
                          ? IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 32.h,
                              ),
                              onPressed: () => Navigator.pop(context),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(width: widget.cameFromDrawer ? 100.w : 140.w),
                      Text(
                        appLocale.profile,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 44.h),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 18.h),
                          width: 120.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                              imageUrl:
                                  'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1985&q=80'),
                        ),
                      ),
                      PositionedDirectional(
                        bottom: 0,
                        start: 100,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 58.w, vertical: 4.h),
                          child: Text(
                            appLocale.profile,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 44.h),
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
                        Text(appLocale.city, style: _labelStyle),
                        SizedBox(height: 16.h),
                        MyTextFormField(
                          controller: _cityController,
                          filled: false,
                          border: const OutlineInputBorder(),
                          borderRadius: 5.r,
                          actionType: TextInputAction.done,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a valid value';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  My_Button(buttonText: appLocale.save, onTap: _preformAction),
                  SizedBox(height: 46.h),
                ],
              ),
            ),
          ),
          loading ? const LoadingWidget() : const SizedBox.shrink(),
        ],
      ),
      bottomNavigationBar: const SizedBox(),
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
          .then(
              (value) => widget.cameFromDrawer ? Navigator.pop(context) : null);
    }
  }
}
