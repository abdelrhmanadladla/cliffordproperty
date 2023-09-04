import 'package:cliffordproperty/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final SystemUiOverlayStyle _style =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(_style);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [Locale('en')],
          locale: const Locale('en'),
          title: 'CliffordProperty',
          theme: ThemeData(
            fontFamily: 'Podkova',
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color(0xffFF914D),
                  secondary: const Color(0xffF0D2AE),
                  surface: const Color(0xff747474),
                  onSecondary: const Color(0xffCA0F0F),
                  onSecondaryContainer: const Color(0xffD9D9D9),
                  onPrimary: const Color(0xff3387DB),
                  onBackground: const Color(0xffF4F4F4),
                  primaryContainer: const Color(0xffE9E8E8),
                ),
            textTheme: TextTheme(
              headlineSmall: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
              ),
              headlineMedium: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              bodySmall: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
              ),
              displaySmall: TextStyle(
                color: const Color(0xff747474),
                fontSize: 12.sp,
              ),
              bodyMedium: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),
          home: // const SplashScreen(),
              const HomeScreen(),
        );
      },
    );
  }
}
