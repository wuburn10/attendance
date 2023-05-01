import 'package:flutter/material.dart';
import 'package:attendance/record.dart';

class DetailsPage extends StatelessWidget {
  final RecordAttendance attendance;

  const DetailsPage({Key? key, required this.attendance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF486A71),
        title: const Text('Attendance Record App (Details Page)'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User: ${attendance.user}'),
            SizedBox(height: 8.0),
            Text('Phone: ${attendance.phone}'),
            SizedBox(height: 8.0),
            Text('Check-in Time: ${attendance.checkIn.toString()}'),
          ],
        ),
      ),
    );
  }
}
