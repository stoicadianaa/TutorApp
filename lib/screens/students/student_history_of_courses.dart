import 'package:flutter/material.dart';

class StudentHistory extends StatefulWidget {
  const StudentHistory({Key? key}) : super(key: key);

  static String id = 'student-history';

  @override
  State<StudentHistory> createState() => _StudentHistoryState();
}

class _StudentHistoryState extends State<StudentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Course History'),),
      body: Container(

      ),
    );
  }
}
