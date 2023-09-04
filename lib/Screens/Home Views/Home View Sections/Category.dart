import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef ReturnIndex = int Function();

class Category extends StatelessWidget {
  const Category({required this.selectedIndex, super.key, this.onTap});
  final int selectedIndex;
  final Function(int index)? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: onTap == null
                ? null
                : () {
                    onTap!(index);
                  },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 11.h),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? Theme.of(context).colorScheme.primary
                    : const Color(0xffF6F5F5),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'House',
                style: TextStyle(
                  color: selectedIndex == index ? Colors.white : Colors.black,
                  fontSize: 16.sp,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemCount: 7,
      ),
    );
  }
}
