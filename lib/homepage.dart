import 'package:attendance/record.dart';
import 'package:attendance/detailspage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RecordAttendance> attendanceList = [
    RecordAttendance(
        "Chan Saw Lin", "0152131113", DateTime.parse("2020-06-30 16:10:05")),
    RecordAttendance(
        "Abu bin Ali", "0152131113", DateTime.parse("2023-05-03 16:10:05")),
    RecordAttendance(
        "Reuben Lee", "0152131113", DateTime.parse("2023-05-04 03:10:05")),
    RecordAttendance(
        "Lee Saw Loy", "0161231346", DateTime.parse("2020-07-11 15:39:59")),
    RecordAttendance(
        "Khaw Tong Lin", "0158398109", DateTime.parse("2020-08-19 11:10:18")),
    RecordAttendance(
        "Lim Kok Lin", "0168279101", DateTime.parse("2020-08-19 11:11:35")),
    RecordAttendance(
        "Low Jun Wei", "0112731912", DateTime.parse("2020-08-15 13:00:05")),
    RecordAttendance(
        "Yong Weng Kai", "0172332743", DateTime.parse("2020-07-31 18:10:11")),
    RecordAttendance(
        "Jayden Lee", "0191236439", DateTime.parse("2020-08-22 08:10:38")),
    RecordAttendance(
        "Kong Kah Yan", "0111931233", DateTime.parse("2020-07-11 12:00:00")),
    RecordAttendance(
        "Jasmine Lau", "0162879190", DateTime.parse("2020-08-01 12:10:05")),
    RecordAttendance(
        "Chan Saw Lin", "016783239", DateTime.parse("2020-08-23 11:59:05")),
    RecordAttendance(
        "Jasmine Lau", "0162879190", DateTime.parse("2020-08-01 12:10:05")),
  ];

  List<RecordAttendance> searchAttendanceList = [];

  final List<bool> _selections = <bool>[true, false];

  bool _selectionsTimeAgo = true;

  List<bool> getSelections() {
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

    bool timeAgo;

    _loadSelectedTimeAgo() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        timeAgo = prefs.getBool('selectedTimeAgo') ??
            true; // Default value is true if the value is not stored in SharedPreferences
      });
    }

    void _onTimeFormatChanged(bool newValue) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('selectedTimeAgo', newValue);
      setState(() {
        timeAgo = newValue;
      });
    }

    @override
    void initState() {
      super.initState();
      _loadSelectedTimeAgo();
    }
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
                  child: const Text('Phone'),
                ),
                TextField(
                  controller: phoneController,
                  autofocus: true,
                  decoration: const InputDecoration(
                      hintText: "Enter your phone number"),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: const Text("Submit"),
                onPressed: () {
                  final success = SnackBar(
                      content: const Text("New record is added!"),
                      duration: const Duration(seconds: 3),
                      action: SnackBarAction(
                          label: "Close",
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          }));
                  ScaffoldMessenger.of(context).showSnackBar(success);
                  final name = nameController.text;
                  final phone = phoneController.text;
                  final record = RecordAttendance(
                      name, phone, DateTime.now(), _selectionsTimeAgo);
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
    attendanceList
        .sort((a, b) => b.checkIn.compareTo(a.checkIn)); // sorting new -> old
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF486A71),
        title: const Text('Attendance Record App'),
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
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
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
                  const Expanded(
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
                              if (index == 1) {
                                // dd MM yy
                                _selectionsTimeAgo = false;
                                _selections[0] = false;
                                _selections[1] = true;
                              } else {
                                // time Ago
                                _selectionsTimeAgo = true;
                                _selections[1] = false;
                                _selections[0] = true;
                              }
                            });
                            setState(() {});
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
                        searchAttendanceList[index].user,
                        searchAttendanceList[index].phone,
                        searchAttendanceList[index].checkIn,
                        _selectionsTimeAgo),
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
