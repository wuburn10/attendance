import 'package:attendance/record.dart';
import 'package:attendance/detailspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RecordAttendance> attendanceList = [
    RecordAttendance(
        user: "Chan Saw Lin",
        phone: "0152131113",
        checkIn: DateTime.parse("2023-05-04 16:10:05")),
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

  List<RecordAttendance> searchAttendanceList = [];


  final List<bool> _selections = <bool>[true, false];

  bool _selectionsTimeAgo = true;

  List<bool> getSelections(){
    return _selections;
  }

  @override
  void initState() {
    super.initState();
    searchAttendanceList = attendanceList;
  }

  // Filter for search bar
  void _runFilter(String enteredKeyword) {
    List<RecordAttendance> results = [];
    if (enteredKeyword.isEmpty) {
      results = attendanceList;
    } else {
      results = attendanceList
          .where((record) =>
              record.user.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      searchAttendanceList = results;
    });
  }

  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  // Open Add Record Dialog
  Future openDialog() => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text('Add New Record'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('User'),
                ),
                TextField(
                  controller: nameController,
                  autofocus: true,
                  decoration: InputDecoration(hintText: "Enter your name"),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Phone'),
                ),
                TextField(
                  controller: phoneController,
                  autofocus: true,
                  decoration:
                      InputDecoration(hintText: "Enter your phone number"),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text("Submit"),
                onPressed: () {
                  final name = nameController.text;
                  final phone = phoneController.text;
                  final record = RecordAttendance(
                      user: name, phone: phone, checkIn: DateTime.now());
                  setState(() {
                    attendanceList.add(record);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));

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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                labelText: 'User',
                hintText: "Enter User's Name",
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF6A8A99)),
                color: const Color(0xFF6A8A99),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'User',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Phone',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        ToggleButtons(
                          isSelected: _selections,
                          fillColor: Colors.blue[50],
                          selectedColor: const Color(0xFF6A8A99),
                          onPressed: (int index) {
                            setState(() {
                              _selections[index] = !_selections[index];
                              if (index == 1){ // dd MM yy
                                _selectionsTimeAgo = false;
                                _selections[0] = false;
                                _selections[1] = true;
                                print(_selectionsTimeAgo);
                              }else{ // time Ago
                                _selectionsTimeAgo = true;
                                _selections[1] = false;
                                _selections[0] = true;
                                print(_selectionsTimeAgo);
                              }
                            });
                          },
                          children: const [
                            Icon(Icons.access_time),
                            Icon(Icons.calendar_month),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: searchAttendanceList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            attendance: searchAttendanceList[index],
                          ),
                        ),
                      );
                    },
                    child: RecordAttendance(
                      user: searchAttendanceList[index].user,
                      phone: searchAttendanceList[index].phone,
                      checkIn: searchAttendanceList[index].checkIn,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: FloatingActionButton(
          onPressed: () {
            openDialog();
          },
          backgroundColor: const Color(0xFFDB823F),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
