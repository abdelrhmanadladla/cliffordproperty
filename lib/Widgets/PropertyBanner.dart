import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliffordproperty/Helpers/Nav_Helper.dart';
import 'package:cliffordproperty/Models/PropertyModel.dart';
import 'package:cliffordproperty/Screens/ShowPropertyInfo.dart';
import 'package:cliffordproperty/Widgets/FavoriteWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PropertyBanner extends StatelessWidget with Nav_Helper {
  final PropertyModel property;
  const PropertyBanner({required this.property, super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => jump(context, ShowPropertyInfo(property: property)),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 1,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
              width: 1.w,
              color: Theme.of(context).colorScheme.primaryContainer),
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: property.imageUrl,
              height: 178.h,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Text(property.propertyTitle),
                      const Spacer(),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${property.price}\$',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            TextSpan(
                              text: '/ month',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.surface,
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
                        property.location.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset('assets/images/bed.svg'),
                      SizedBox(width: 8.w),
                      Text(
                        '${property.beds} Beds',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      SizedBox(width: 16.w),
                      SvgPicture.asset('assets/images/bath.svg'),
                      SizedBox(width: 8.w),
                      Text(
                        '${property.baths} Bathroom',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      SizedBox(width: 16.w),
                      SvgPicture.asset('assets/images/kitchen.svg'),
                      SizedBox(width: 8.w),
                      Text(
                        '${property.kitchens} kitchens',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      const Spacer(),
                      FavoriteWidget(isFav: property.isFav ?? false),
                    ],
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
