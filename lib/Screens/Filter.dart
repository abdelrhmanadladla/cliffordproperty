import 'package:cliffordproperty/Widgets/LoadingWidget.dart';
import 'package:cliffordproperty/Widgets/MyFilterSelector.dart';
import 'package:cliffordproperty/Widgets/MySearchBar.dart';
import 'package:cliffordproperty/Widgets/My_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  late TextEditingController _controller;
  late List<String> bedroomTypes;
  late int selectedBedroomType;
  late List<String> bathroomsTypes;
  late int selectedBathroomType;
  late List<String> filterSearch;
  get _textStyle => TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700);
  initData() {
    _controller = TextEditingController();
    priceSliderValues = const RangeValues(100, 300);
    sizeSliderValues = const RangeValues(50, 750);
    bedroomTypes = ['studio', '1', '2', '3', '4', 'Any'];
    bathroomsTypes = ['Any', '1', '2', '3', '4'];
    selectedBathroomType = 0;
    selectedBedroomType = 0;
    filterSearch = [];
    setState(() {});
  }

  late RangeValues priceSliderValues;
  late RangeValues sizeSliderValues;
  @override
  void initState() {
    super.initState();
    initData();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.close, size: 32.h),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        appLocale.filter,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: initData,
                        child: Text(
                          appLocale.reset,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 28.h),
                  MySearchBar(
                    hasTrailing: false,
                    controller: _controller,
                    hasPadding: false,
                    onSubmit: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          filterSearch.add(value);
                        });
                      }
                    },
                  ),
                  filterSearch.isEmpty
                      ? const SizedBox.shrink()
                      : SizedBox(height: 20.h),
                  filterSearch.isNotEmpty
                      ? Wrap(
                          spacing: 16.w,
                          runSpacing: 10.h,
                          children: List.generate(
                            filterSearch.length,
                            (index) => Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffFFC7A5),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsetsDirectional.only(
                                  start: 12.w, top: 2.h),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(filterSearch[index],
                                      style: TextStyle(fontSize: 12.sp)),
                                  SizedBox(width: 4.w),
                                  IconButton(
                                      icon: Icon(Icons.close, size: 16.h),
                                      onPressed: () {
                                        setState(() {
                                          filterSearch.removeAt(index);
                                        });
                                      }),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  SizedBox(height: 24.h),
                  Text(appLocale.priceMonthly),
                  SizedBox(height: 50.h),
                  RangeSlider(
                    values: priceSliderValues,
                    divisions: 100,
                    labels: RangeLabels(
                      '${priceSliderValues.start.floor()} \$',
                      '${priceSliderValues.end.floor()} \$',
                    ),
                    onChanged: (value) {
                      setState(() {
                        priceSliderValues = value;
                      });
                    },
                    max: 1000,
                    min: 10,
                  ),
                  SizedBox(height: 36.h),
                  Text(appLocale.bedrooms, style: _textStyle),
                  SizedBox(height: 16.h),
                  MyFilterSelector(
                    getIndexFunction: (index) {
                      setState(() {
                        selectedBedroomType = index;
                      });
                    },
                    data: bedroomTypes,
                    selectedItem: selectedBedroomType,
                  ),
                  SizedBox(height: 24.h),
                  Text(appLocale.bathrooms, style: _textStyle),
                  SizedBox(height: 16.h),
                  MyFilterSelector(
                    getIndexFunction: (index) {
                      setState(() {
                        selectedBathroomType = index;
                      });
                    },
                    data: bathroomsTypes,
                    selectedItem: selectedBathroomType,
                  ),
                  SizedBox(height: 24.h),
                  Text(appLocale.propertySize, style: _textStyle),
                  RangeSlider(
                    values: sizeSliderValues,
                    divisions: 100,
                    labels: RangeLabels(
                      '${sizeSliderValues.start.floor()} sq/ft',
                      '${sizeSliderValues.end.floor()} sq/ft',
                    ),
                    onChanged: (value) {
                      setState(() {
                        sizeSliderValues = value;
                      });
                    },
                    max: 2000,
                    min: 10,
                  ),
                  SizedBox(height: 90.h),
                  My_Button(
                    buttonText: appLocale.showProperties,
                    onTap: _preformAction,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
          isLoading ? const LoadingWidget() : const SizedBox.shrink(),
        ],
      ),
    );
  }

  _preformAction() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          isLoading = false;
        });
      },
    ).then((value) => Navigator.pop(context));
  }
}
