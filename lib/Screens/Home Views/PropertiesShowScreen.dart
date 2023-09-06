import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Models/PropertyModel.dart';
import '../../Widgets/PropertyViewWidget.dart';

class PropertiesShowScreen extends StatefulWidget {
  final int pageNumber;
  const PropertiesShowScreen({this.pageNumber = 1, super.key});

  @override
  State<PropertiesShowScreen> createState() => _PropertiesShowScreenState();
}

class _PropertiesShowScreenState extends State<PropertiesShowScreen> {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;

  @override
  Widget build(BuildContext context) {
    List<PropertyModel> properties = List.generate(
      20,
      (index) => PropertyModel(
          isFav: widget.pageNumber == 1,
          price: 450,
          imageUrl:
              'https://www.rocketmortgage.com/resources-cmsassets/RocketMortgage.com/Article_Images/Large_Images/Stock-Modern-House-In-Twilight-AdobeStock-368976934-copy.jpg',
          location: 'ny new york',
          propertyTitle: 'Dreamsville House',
          baths: 4,
          beds: 4,
          kitchens: 2,
          id: '$index',
          description:
              'lets place some it ems in here and you can place a catchy slogan here which can elaborate...'),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  widget.pageNumber != 1
                      ? IconButton(
                          icon: Icon(Icons.arrow_back_ios, size: 32.h),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                      : const SizedBox.shrink(),
                  SizedBox(
                    width: widget.pageNumber == 1
                        ? 150.w
                        : widget.pageNumber == 2
                            ? 80.w
                            : 60.w,
                  ),
                  Text(
                    widget.pageNumber == 1
                        ? appLocale.favorite
                        : widget.pageNumber == 2
                            ? appLocale.nearestYou
                            : appLocale.recommendForYou,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              GridView.builder(
                shrinkWrap: true,
                itemCount: properties.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 70.w / 112.h,
                ),
                itemBuilder: (context, index) =>
                    PropertyViewWidget(property: properties[index]),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
