import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutor_app/screens/students/students_register_to_course.dart';
import 'student_history_of_courses.dart';

class StudentsMainScreen extends StatefulWidget {
  StudentsMainScreen({this.message, this.appBarMessage});
  final appBarMessage;
  final message;
  static final id = 'students-main';

  @override
  _StudentsMainScreenState createState() => _StudentsMainScreenState();
}

class _StudentsMainScreenState extends State<StudentsMainScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        //print(loggedInUser.email);
      }
    } catch (e) {
      //print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student\'s Screen'),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterToCourse.id);
                    },
                    child: const Text('Register to a new course')
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, StudentHistory.id);
                    },
                    child: const Text('History of the courses')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
