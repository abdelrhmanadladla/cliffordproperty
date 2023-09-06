import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteWidget extends StatelessWidget {
  final bool isFav;
  const FavoriteWidget({required this.isFav, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.h),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      child: Icon(
        Icons.favorite,
        color: isFav ? Colors.red : Colors.white,
        size: 20.h,
      ),
    );
  }
}
