import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef GetIndexFunction = Function(int index);

class MyFilterSelector extends StatelessWidget {
  final List<String> data;
  final GetIndexFunction getIndexFunction;
  final int selectedItem;
  const MyFilterSelector({
    super.key,
    required this.getIndexFunction,
    required this.data,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              getIndexFunction(index);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: selectedItem == index
                    ? const Color(0xffFFC7A5)
                    : const Color(0xffE4E4E5),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(data[index], style: TextStyle(fontSize: 12.sp)),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemCount: data.length,
      ),
    );
  }
}
