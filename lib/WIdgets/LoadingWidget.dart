import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: AlignmentDirectional.center,
      color: Colors.grey.withOpacity(.5),
      child: LoadingAnimationWidget.threeRotatingDots(
        color: Theme.of(context).colorScheme.primary,
        size: 64.h,
      ),
    );
  }
}
