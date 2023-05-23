import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:marzbo_app_mobile/presentation/feature/created_post/view/custom_switch_button.dart';
import 'package:marzbo_app_mobile/presentation/feature/created_post/view/custome_calender.dart';
import 'package:marzbo_app_mobile/resources/app_colors.dart';
import 'package:marzbo_app_mobile/widgets/basic_layout.dart';
import 'package:marzbo_app_mobile/widgets/spacing.dart';
import 'package:table_calendar/table_calendar.dart';

class SeletctTimeScreens extends StatefulWidget {
  const SeletctTimeScreens({super.key});

  @override
  State<SeletctTimeScreens> createState() => _SeletctTimeScreensState();
}

class _SeletctTimeScreensState extends State<SeletctTimeScreens> {
  @override
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
        appBar: _buildAppBarSelectimeScreens(context),
        headerVisible: false,
        padding: EdgeInsets.symmetric(horizontal: 29.r),
        child: SingleChildScrollView(
          child: Column(children: [
            _buildCalendarBooking(),
            Spacing(1.r),
            _buildFieldTime(),
            Spacing(1.5.r),
            _buildViewTime()
          ]),
        ));
  }

  AppBar _buildAppBarSelectimeScreens(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: AppColors.primaryLightColor,
      centerTitle: false,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                height: 22,
                child: const Text('Schedule Post',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(
                width: 40,
                child: TextButton(
                    onPressed: () =>
                        {Navigator.of(context, rootNavigator: true).pop(null)},
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 40,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildViewTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Schedule',
            textAlign: TextAlign.left,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
            )),
        Text('Apr 30, 2023 11:19 PM',
            textAlign: TextAlign.left,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
            )),
      ],
    );
  }

  Widget _buildCalendarBooking() {
    final List<DateTime?>? listDate = [];

    // listCheckBookingData?.forEach((item) => {
    //       listDate!.add(
    //         item?.date,
    //       )
    //     });

    return Container(
        width: 317.w,
        child: TableCalendarCustom(
          startingDayOfWeek: StartingDayOfWeek.sunday,
          locale: "en_US", firstDay: DateTime.now(),
          lastDay: DateTime(DateTime.now().year + 5),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          headerStyle: HeaderStyle(
              titleTextFormatter: (day, locale) =>
                  DateFormat.yMMMM(locale).format(day),
              titleCentered: false,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
              leftChevronIcon: Icon(
                Icons.chevron_left,
                size: 29.sp,
                color: Color(0xffA8DADC),
              ),
              leftChevronPadding: EdgeInsets.only(left: 20.r),
              rightChevronMargin: EdgeInsets.all(0),
              leftChevronMargin: EdgeInsets.all(0),
              rightChevronPadding: EdgeInsets.all(0),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                size: 29.sp,
                color: Color(0xffA8DADC),
              )),
          rowHeight: 51.h,
          calendarStyle: CalendarStyle(tablePadding: EdgeInsets.all(0)),
          daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) =>
                  DateFormat.E(locale).format(date).toString().toUpperCase(),
              weekdayStyle: TextStyle(
                color: Color.fromRGBO(60, 60, 67, 0.3),
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
              weekendStyle: TextStyle(
                color: Color.fromRGBO(60, 60, 67, 0.3),
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              )),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, date, events) {
              // final checkDate = listDate!
              //     .firstWhereOrNull((element) => element!.isSameDate(date));
              return Container(
                  width: 40.57.w,
                  height: 51.h,
                  alignment: Alignment.center,
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ));
            },
            disabledBuilder: (context, date, focusedDay) => Container(
                width: 40.57.w,
                height: 51.h,
                alignment: Alignment.center,
                child: Text(
                  date.day.toString(),
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                )),
            selectedBuilder: (context, date, events) => Container(
                width: 40.57.w,
                height: 51.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xffA8DADC),
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xffA8DADC))),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff457B9D)),
                )),
            todayBuilder: (context, date, events) => Container(
                width: 40.57.w,
                height: 51.h,
                alignment: Alignment.center,
                child: Text(
                  date.day.toString(),
                  style: TextStyle(
                      color: Color(0xffA8DADC),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400),
                )),
          ),

          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },

          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update `_focusedDay` here as well
            });
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              // Call `setState()` when updating calendar format
              setState(() {
                _calendarFormat = format;
              });
            }
          },

          onPageChanged: (focusedDay) {
            // No need to call `setState()` here
            _focusedDay = focusedDay;
          },
          // Enable week numbers (disabled by default).
        ));
  }

  _buildFieldTime() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('TIME',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8.r),
                  width: 74.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(118, 118, 128, 0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      '${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                _buildBSwitchButton()
              ],
            )
          ],
        ),
        Spacing(1.r),
        Divider(
          height: 0.5.h,
        ),
        Spacing(1.r),
        Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Text('Select a time',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
        ),
        Spacing(1.5.r),
        Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            child: Container(
                width: 108.w,
                height: 37.h,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(29, 53, 87, 1), width: 2.w)),
                child: Center(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/icons/iconTimenow.png',
                          width: 38.w,
                          height: 23.h,
                        ),
                        Spacing(
                          0.5.r,
                          direction: SpacingDirection.Horizontal,
                        ),
                        Text('Now',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Color.fromRGBO(29, 53, 87, 1),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ))
                      ]),
                )),
          ),
        )
      ],
    );
  }

  Widget _buildBSwitchButton() {
    return CustomSwitchButton(
      textOffColor: Colors.black,
      value: true,
      width: 100.w,
      height: 36.h,
      textOn: 'AM',
      textOff: 'PM',
      colorOn: Color.fromRGBO(118, 118, 128, 0.12),
      colorOff: Color.fromRGBO(118, 118, 128, 0.12),
      animationDuration: const Duration(milliseconds: 600),
      onChanged: (bool state) {
        print('turned ${(state) ? 'PM' : 'AM'}');
      },
      onDoubleTap: () {},
      onSwipe: () {},
      onTap: () {},
    );
  }
}
