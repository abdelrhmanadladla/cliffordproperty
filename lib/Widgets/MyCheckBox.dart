import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCheckBox extends StatelessWidget {
  final bool checked;
  const MyCheckBox({required this.checked, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 30.w,
      padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 4.h),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: checked
            ? Theme.of(context).colorScheme.primary
            : Colors.grey.shade300,
        shape: BoxShape.circle,
        border: Border.all(
          color: checked
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface,
          width: checked ? 0.w : 1.w,
        ),
      ),
      child: checked
          ? const Icon(
              Icons.check,
              color: Colors.white,
            )
          : const SizedBox.shrink(),
    );
  }
}
