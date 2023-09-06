import 'package:cliffordproperty/Models/BottomNavModel.dart';
import 'package:cliffordproperty/Screens/Home%20Views/HomeDrawer.dart';
import 'package:cliffordproperty/Screens/Home%20Views/Home_View.dart';
import 'package:cliffordproperty/Screens/Home%20Views/MessagesView.dart';
import 'package:cliffordproperty/Screens/Home%20Views/ProfileView.dart';
import 'package:cliffordproperty/Screens/Home%20Views/PropertiesShowScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<BottomNavItemModel> bottomNavItems = [
      BottomNavItemModel(label: appLocale.home, icon: 'Home'),
      BottomNavItemModel(label: appLocale.favorite, icon: 'Fav'),
      BottomNavItemModel(label: appLocale.messages, icon: 'Message'),
      BottomNavItemModel(label: appLocale.profile, icon: 'Profile'),
    ];
    return Scaffold(
      drawer: const HomeDrawer(),
      body: const [
        HomeView(),
        PropertiesShowScreen(),
        MessagesView(),
        ProfileView(),
      ][selectedIndex],
      bottomNavigationBar: Container(
        padding:
            EdgeInsets.only(right: 41.w, left: 41.w, top: 22.h, bottom: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8.r),
          ),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
            bottomNavItems.length,
            (index) => GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/${bottomNavItems[index].icon}_Icon.png',
                    width: selectedIndex == index ? 32.w : 24.w,
                    color: Colors.white,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    bottomNavItems[index].label,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
