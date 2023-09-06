import 'package:cliffordproperty/Helpers/Nav_Helper.dart';
import 'package:cliffordproperty/Models/PropertyModel.dart';
import 'package:cliffordproperty/Screens/Home%20Views/PropertiesShowScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Widgets/PropertyBanner.dart';

class RecommendedSection extends StatefulWidget {
  const RecommendedSection({super.key});

  @override
  State<RecommendedSection> createState() => _RecommendedSectionState();
}

class _RecommendedSectionState extends State<RecommendedSection>
    with Nav_Helper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  @override
  Widget build(BuildContext context) {
    List<PropertyModel> properties = List.generate(
      3,
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
          id: '$index',
          description:
              'lets place some it ems in here and you can place a catchy slogan here which can elaborate...'),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                appLocale.recommendForYou,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () =>
                    jump(context, const PropertiesShowScreen(pageNumber: 3)),
                child: Text(
                  appLocale.viewAll,
                  style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(.5),
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ListView.separated(
            padding: EdgeInsetsDirectional.only(bottom: 74.h),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                PropertyBanner(property: properties[index]),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: properties.length,
          )
        ],
      ),
    );
  }
}
