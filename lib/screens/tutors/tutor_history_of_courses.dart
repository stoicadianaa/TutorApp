import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'get_tutor_courses.dart';

class TutorHistory extends StatefulWidget {
  const TutorHistory({Key? key}) : super(key: key);

  static String id = 'tutor-history';

  @override
  State<TutorHistory> createState() => _TutorHistoryState();
}

class _TutorHistoryState extends State<TutorHistory> {
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    if (_auth.currentUser?.email != null) {
      getCoursesByTutor(_auth.currentUser?.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
      ),
    );
  }
}
