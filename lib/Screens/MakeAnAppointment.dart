import 'package:cliffordproperty/Models/PropertyModel.dart';
import 'package:cliffordproperty/Models/TimeSelectionModel.dart';
import 'package:cliffordproperty/Widgets/My_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MakeAnAppointment extends StatefulWidget {
  final PropertyModel property;
  const MakeAnAppointment({required this.property, super.key});

  @override
  State<MakeAnAppointment> createState() => _MakeAnAppointmentState();
}

class _MakeAnAppointmentState extends State<MakeAnAppointment> {
  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  List<TimeSelectionModel> times = [
    TimeSelectionModel(time: '3:00 pm', isEnabled: true),
    TimeSelectionModel(time: '12:00 am', isEnabled: true),
    TimeSelectionModel(time: '4:00 pm', isEnabled: false),
    TimeSelectionModel(time: '2:00 am', isEnabled: true),
    TimeSelectionModel(time: '5:00 am', isEnabled: true),
    TimeSelectionModel(time: '1:00 pm', isEnabled: false),
  ];
  late TimeSelectionModel selectedTime =
      times.where((element) => element.isEnabled).first;

  get _textStyle => TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, size: 32.h),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 52.w),
                  Text(widget.property.propertyTitle),
                ],
              ),
              SizedBox(height: 50.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: TableCalendar(
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    rightChevronVisible: false,
                    leftChevronVisible: false,
                    formatButtonVisible: false,
                  ),
                  focusedDay: selectedDate,
                  firstDay: DateTime.now(),
                  weekNumbersVisible: false,
                  currentDay: selectedDate,
                  lastDay: DateTime.now().add(const Duration(days: 30)),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      selectedDate = selectedDay;
                    });
                  },
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                appLocale.time,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 50.w,
                  childAspectRatio: 120 / 40,
                ),
                itemBuilder: (context, index) {
                  return My_Button(
                    onTap: !times[index].isEnabled
                        ? null
                        : () => setState(() => selectedTime = times[index]),
                    buttonText: times[index].time,
                    buttonColor: selectedTime == times[index]
                        ? const Color(0xffFFD5BB)
                        : times[index].isEnabled
                            ? Colors.white
                            : const Color(0xffD9D9D9),
                    textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: selectedTime == times[index]
                          ? Colors.white
                          : const Color(0xff7F7F7F),
                    ),
                  );
                },
                itemCount: times.length,
              ),
              SizedBox(height: 44.h),
              My_Button(
                buttonText: appLocale.confirm,
                onTap: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        title: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 40.h),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 35.w, vertical: 20.h),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      const Color(0xff0277BD).withOpacity(.39),
                                ),
                                child:
                                    SvgPicture.asset('assets/images/done.svg'),
                              ),
                              SizedBox(height: 35.h),
                              Text(
                                appLocale.thankYou,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                appLocale.yourAppointmentSuccessful,
                                style: _textStyle,
                              ),
                              SizedBox(height: 18.h),
                              Text(
                                '${appLocale.youBookedAnAppointment} ${DateFormat('EEEE').format(selectedDate)} ${selectedDate.day}  At ${selectedTime.time}',
                                style: _textStyle,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 100.h),
                              My_Button(
                                buttonText: appLocale.done,
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 44.h),
            ],
          ),
        ),
      ),
    );
  }
}
