import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordAttendance extends StatelessWidget {
  final String user;
  final String phone;
  final DateTime checkIn;

  RecordAttendance({
    required this.user,
    required this.phone,
    required this.checkIn,
  });

  String _getTimeDifference() {
    final Duration timeDiff = DateTime.now().difference(checkIn);
    if (timeDiff.inHours < 1) {
      if (timeDiff.inMinutes == 0){
        return '< 1 minute ago';
      }
      return '${timeDiff.inMinutes} minute ago';
    }else if(timeDiff.inHours > 100){
      return '> 100 hours ago';
    }
    return '${timeDiff.inHours} hours ago';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF6A8A99)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  user,
                  style: const TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  phone,
                  style: const TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  _getTimeDifference(),
                  style: const TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
