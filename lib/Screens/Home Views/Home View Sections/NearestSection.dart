import 'package:cliffordproperty/WIdgets/PropertyViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Models/PropertyModel.dart';

class NearestSection extends StatelessWidget {
  const NearestSection({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    List<PropertyModel> properties = List.generate(
      2,
      (index) => PropertyModel(
        isFav: index == 1,
        price: 450,
        imageUrl:
            'https://www.rocketmortgage.com/resources-cmsassets/RocketMortgage.com/Article_Images/Large_Images/Stock-Modern-House-In-Twilight-AdobeStock-368976934-copy.jpg',
        location: 'ny new york',
        propertyTitle: 'Dreamsville House',
        baths: 4,
        beds: 4,
        kitchens: 2,
      ),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(appLocale.nearestYou,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
              Text(appLocale.viewAll,
                  style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(.5),
                    fontSize: 12.sp,
                  )),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: <Widget>[
              Expanded(
                child: PropertyViewWidget(property: properties[0]),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: PropertyViewWidget(property: properties[1]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
