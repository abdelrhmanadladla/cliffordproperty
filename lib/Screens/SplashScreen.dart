import 'package:cliffordproperty/Helpers/Nav_Helper.dart';
import 'package:cliffordproperty/Screens/onBoarding.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with Nav_Helper {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),
        () => jump(context, const OnBoarding(), replace: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(tag: 'logo', child: Image.asset('assets/images/logo.png')),
      ),
    );
  }
}
