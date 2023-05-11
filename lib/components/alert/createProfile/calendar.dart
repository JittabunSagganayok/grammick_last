import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:we_link/constant/stylesConstants.dart';

class calendar extends StatefulWidget {
  calendar({Key? key}) : super(key: key);

  @override
  State<calendar> createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 20, 40, 30),
      child: TableCalendar(
        firstDay: DateTime(
            DateTime.now().year, DateTime.now().month - 3, DateTime.now().day),
        lastDay: DateTime(
            DateTime.now().year, DateTime.now().month + 3, DateTime.now().day),
        focusedDay: _focusedDay,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: dayOfWeekText,
          weekendStyle: dayOfWeekText,
        ),
        calendarStyle: CalendarStyle(
          defaultTextStyle: calendarText,
          weekendTextStyle: calendarText,
          selectedDecoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFB912F)),
          todayDecoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFF219653)),
          selectedTextStyle: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 15, color: Colors.white),
          // todayTextStyle: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontSize: 22.0,
          //     color: Colors.white)
        ),
        headerStyle: HeaderStyle(
          leftChevronIcon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF219653),
            size: 20,
          ),
          rightChevronIcon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xFF219653),
            size: 20,
          ),
          titleCentered: true,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: Color(0xFF333333)),
          formatButtonVisible: false,
        ),
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
