// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 184, 4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime(2020, 1, 1),
              lastDay: DateTime(2025, 12, 31),
              focusedDay: _focusedDay,
              daysOfWeekHeight: 50,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
        
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
        
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
        
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                formatButtonTextStyle: AppStyle.styleRegular20(context)
                    .copyWith(color: Colors.white),
                titleCentered: true,
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: MediaQuery.sizeOf(context).width > 600 ? 50 : null,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: MediaQuery.sizeOf(context).width > 600 ? 50 : null,
                ),
                titleTextStyle: AppStyle.styleRegular20(context)
                    .copyWith(color: Colors.white),
              ),
        
              calendarStyle: CalendarStyle(
                defaultTextStyle: AppStyle.styleRegular20(context)
                    .copyWith(color: Colors.white),
                weekendTextStyle: AppStyle.styleRegular20(context)
                    .copyWith(color: Colors.white),
                selectedDecoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                outsideDaysVisible: false,
                outsideTextStyle: AppStyle.styleRegular20(context)
                    .copyWith(color: Colors.white),
                holidayTextStyle: AppStyle.styleRegular20(context)
                    .copyWith(color: Colors.white),
                weekendDecoration: const BoxDecoration(shape: BoxShape.circle),
              ),
        
              daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: AppStyle.styleRegular20(context)
                      .copyWith(color: Colors.white),
                  weekendStyle: AppStyle.styleRegular20(context)
                      .copyWith(color: Colors.white),
                  decoration: const BoxDecoration(color: Colors.transparent)),
        
              startingDayOfWeek: StartingDayOfWeek.saturday,
              availableGestures: AvailableGestures.all,
              // availableCalendarFormats: const {
              //   CalendarFormat.month: '',
              //   CalendarFormat.week: 'أسبوع',
              // },
        
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, date, _) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: MyColors.premiumColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${date.day}',
                      style: AppStyle.styleRegular17(context)
                          .copyWith(color: Colors.white),
                    ),
                  );
                },
                todayBuilder: (context, date, _) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${date.day}',
                      style: AppStyle.styleRegular17(context)
                          .copyWith(color: Colors.black),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                 
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: MyColors.premiumColor
                  ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: FittedBox(
                      child: Text('Select Day',
                          style: AppStyle.styleBold20(context)
                              .copyWith(color: Colors.white)),
                    )),
              ),
            ),

            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
