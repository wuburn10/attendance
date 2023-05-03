import 'package:flutter/material.dart';
import 'package:attendance/record.dart';
import 'package:share_plus/share_plus.dart';

class DetailsPage extends StatelessWidget {
  final RecordAttendance attendance;

  const DetailsPage({Key? key, required this.attendance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF486A71),
        title: const Text('Attendance Record App (Details)'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset('lib/images/profile.png'),
            ),
            Text(
              'User : ${attendance.user}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Phone : ${attendance.phone}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Check-in Time : ${attendance.checkIn.toString()}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      Share.share(attendance.phone);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFFDB823F), // Background color
                    ),
                    child: const Text("Share")))
          ],
        ),
      ),
    );
  }
}
