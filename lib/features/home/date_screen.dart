import 'package:bdcallingtaskmanagerapp/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DateScreen extends StatefulWidget {
  const DateScreen({super.key});

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> _events = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bodyColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'assets/images/btn_back.png',
            width: 36,
            height: 36,
          ),
          onPressed: () {
            Navigator.pop(context); // Handle back navigation
          },
        ),
        title: Text(
          'See Your Task',
          style: TextStyle(
            fontFamily: 'Chakra Petch',
            color: AppColor.textPrimaryColor,
            fontSize: 24,
            fontWeight: FontWeight.w600, // Adjust weight as needed
          ),
        ), // Optional - centers the title
        backgroundColor: AppColor.bodyColor, // Custom background color
        elevation: 0, // Remove shadow if needed
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime(2000),
            lastDay: DateTime(2050),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            eventLoader: (day) {
              return _events[day] ?? [];
            },
            calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle(color: AppColor.textPrimaryColor),
              todayDecoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              // Set chevron icons to white
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: Colors.white,
              ), // Previous month button
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ), // Next month button
              // Optional: Customize other header elements
              titleTextStyle: TextStyle(
                color: Colors.white,
              ), // Header background
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              formatButtonTextStyle: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
        ],
      ), 
    );
  }



}

class Event {
  final String title;

  Event(this.title);
}
