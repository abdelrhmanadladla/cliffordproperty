import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliffordproperty/Helpers/Nav_Helper.dart';
import 'package:cliffordproperty/Models/PropertyModel.dart';
import 'package:cliffordproperty/Screens/MakeAnAppointment.dart';
import 'package:cliffordproperty/Widgets/My_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ShowPropertyInfo extends StatefulWidget {
  final PropertyModel property;
  const ShowPropertyInfo({required this.property, super.key});

  @override
  State<ShowPropertyInfo> createState() => _ShowPropertyInfoState();
}

class _ShowPropertyInfoState extends State<ShowPropertyInfo> with Nav_Helper {
  late DraggableScrollableController _controller;
  @override
  void initState() {
    super.initState();
    _controller = DraggableScrollableController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 28.h),
              Row(
                children: <Widget>[
                  SizedBox(width: 16.w),
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 32.h),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(width: 60.w),
                  Text(widget.property.propertyTitle ?? ''),
                ],
              ),
              SizedBox(height: 25.h),
              CachedNetworkImage(
                imageUrl: widget.property.imageUrl,
                height: 250.h,
                fit: BoxFit.fill,
              ),
            ],
          ),
          DraggableScrollableSheet(
            minChildSize: .59,
            maxChildSize: .9,
            initialChildSize: .59,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32.r),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            Text(
                              widget.property.propertyTitle ?? '',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${widget.property.price}\$',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '/ month',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.not_listed_location_rounded,
                              size: 16.w,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              widget.property.location.toUpperCase(),
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 26.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            MyCardView(
                                image: 'bed', number: widget.property.beds),
                            MyCardView(
                                image: 'bath', number: widget.property.baths),
                            MyCardView(
                                image: 'kitchen',
                                number: widget.property.kitchens),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          appLocale.description,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(widget.property.description),
                        SizedBox(height: 20.h),
                        Divider(
                          height: 32.h,
                          thickness: 2.h,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 18.h),
                              width: 120.w,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1985&q=80',
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Column(
                              children: [
                                Text(
                                  'LARA',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Owner',
                                  style: TextStyle(fontSize: 8.sp),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 9.h),
                              decoration: BoxDecoration(
                                color: const Color(0xffFFC7A5),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Image.asset(
                                'assets/images/Message_Icon.png',
                                height: 21.h,
                              ),
                            ),
                            SizedBox(width: 8.w),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        My_Button(
                          buttonText: appLocale.getSchedule,
                          onTap: () => jump(context,
                              MakeAnAppointment(property: widget.property)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class MyCardView extends StatelessWidget {
  final String image;
  final num number;
  const MyCardView({
    super.key,
    required this.image,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFF914D).withOpacity(.5),
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 34.w),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/$image.svg',
            height: 32.h,
          ),
          SizedBox(height: 8.w),
          Text(
            '$number Beds',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
