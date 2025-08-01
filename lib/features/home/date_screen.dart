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

    _events = {
      DateTime(2023, 6, 10): [
        Event('সকাল ১১টায় মিটিং'),
        Event('বিকাল ৩টায় ডাক্তারের অ্যাপয়েন্টমেন্ট'),
      ],
      DateTime(2023, 6, 15): [Event('ফ্লাটার প্রোজেক্ট জমা দেওয়ার শেষ তারিখ')],
    };
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
          Expanded(child: _buildEventList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddEventDialog(),
      ),
    );
  }

  Widget _buildEventList() {
    if (_selectedDay == null || _events[_selectedDay] == null) {
      return Center(child: Text('কোন ইভেন্ট নেই'));
    }

    return ListView.builder(
      itemCount: _events[_selectedDay]!.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            title: Text(_events[_selectedDay]![index].title),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteEvent(index),
            ),
          ),
        );
      },
    );
  }

  void _showAddEventDialog() {
    TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('নতুন ইভেন্ট যোগ করুন'),
            content: TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'ইভেন্টের বিবরণ লিখুন'),
            ),
            actions: [
              TextButton(
                child: Text('বাতিল'),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text('যোগ করুন'),
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    setState(() {
                      if (_selectedDay != null) {
                        if (_events[_selectedDay!] == null) {
                          _events[_selectedDay!] = [];
                        }
                        _events[_selectedDay!]!.add(Event(_controller.text));
                      }
                    });
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
    );
  }

  void _deleteEvent(int index) {
    setState(() {
      _events[_selectedDay!]!.removeAt(index);
      if (_events[_selectedDay!]!.isEmpty) {
        _events.remove(_selectedDay!);
      }
    });
  }
}

class Event {
  final String title;

  Event(this.title);
}
