import 'package:attendance/record.dart';
import 'package:attendance/detailspage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  List<RecordAttendance> attendanceList = [
    RecordAttendance(
        user: "Chan Saw Lin",
        phone: "0152131113",
        checkIn: DateTime.parse("2020-06-30 16:10:05")),
    RecordAttendance(
        user: "Lee Saw Loy",
        phone: "0161231346",
        checkIn: DateTime.parse("2020-07-11 15:39:59")),
    RecordAttendance(
        user: "Khaw Tong Lin",
        phone: "0158398109",
        checkIn: DateTime.parse("2020-08-19 11:10:18")),
    RecordAttendance(
        user: "Lim Kok Lin",
        phone: "0168279101",
        checkIn: DateTime.parse("2020-08-19 11:11:35")),
    RecordAttendance(
        user: "Low Jun Wei",
        phone: "0112731912",
        checkIn: DateTime.parse("2020-08-15 13:00:05")),
    RecordAttendance(
        user: "Yong Weng Kai",
        phone: "0172332743",
        checkIn: DateTime.parse("2020-07-31 18:10:11")),
    RecordAttendance(
        user: "Jayden Lee",
        phone: "0191236439",
        checkIn: DateTime.parse("2020-08-22 08:10:38")),
    RecordAttendance(
        user: "Kong Kah Yan",
        phone: "0111931233",
        checkIn: DateTime.parse("2020-07-11 12:00:00")),
    RecordAttendance(
        user: "Jasmine Lau",
        phone: "0162879190",
        checkIn: DateTime.parse("2020-08-01 12:10:05")),
    RecordAttendance(
        user: "Chan Saw Lin",
        phone: "016783239",
        checkIn: DateTime.parse("2020-08-23 11:59:05")),
    RecordAttendance(
        user: "Jasmine Lau",
        phone: "0162879190",
        checkIn: DateTime.parse("2020-08-01 12:10:05")),
  ];

  @override
  Widget build(BuildContext context) {
    attendanceList.sort(
        (a, b) => b.checkIn.compareTo(a.checkIn)); // sorting to new -> old
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF486A71),
        title: Text('Attendance Record App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF6A8A99)),
                color: Color(0xFF6A8A99),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'User',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Phone',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Check In',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: ListView.builder(
                itemCount: attendanceList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            attendance: attendanceList[index],
                          ),
                        ),
                      );
                    },
                    child: RecordAttendance(
                      user: attendanceList[index].user,
                      phone: attendanceList[index].phone,
                      checkIn: attendanceList[index].checkIn,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
