import 'package:cliffordproperty/Models/PropertyModel.dart';
import 'package:cliffordproperty/WIdgets/FavoriteWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyViewWidget extends StatelessWidget {
  final PropertyModel property;
  const PropertyViewWidget({required this.property, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
            width: 1.w, color: Theme.of(context).colorScheme.primaryContainer),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            property.imageUrl!,
            height: 112.h,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(property.propertyTitle!),
          ),
          SizedBox(height: 5.h),
          Row(
            children: <Widget>[
              SizedBox(width: 9.w),
              Icon(
                Icons.not_listed_location_rounded,
                size: 16.w,
                color: Theme.of(context).colorScheme.surface,
              ),
              SizedBox(width: 2.w),
              Text(
                property.location!.toUpperCase(),
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: <Widget>[
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
                const Spacer(),
                FavoriteWidget(isFav: property.isFav ?? false),
              ],
            ),
          ),
          SizedBox(height: 18.h),
        ],
      ),
    );
  }
}
