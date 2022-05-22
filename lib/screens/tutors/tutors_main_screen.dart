import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutor_app/screens/tutors/profile_screen.dart';
import 'package:tutor_app/screens/tutors/tutor_history_of_courses.dart';
import 'package:tutor_app/screens/tutors/tutors_create_course.dart';
import 'get_tutor_courses.dart';

class TutorsMainScreen extends StatefulWidget {
  static const id = 'tutors-main';

  @override
  _TutorsMainScreenState createState() => _TutorsMainScreenState();
}

class _TutorsMainScreenState extends State<TutorsMainScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getCoursesByTutor(_auth.currentUser?.email);
  }

  void getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tutor\'s Screen')),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, TutorProfile.id);
                  },
                  child: const Text('Create a Profile'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CreateCourse.id);
                  },
                  child: const Text('Create a Course'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, TutorHistory.id);
                  },
                  child: const Text('Course\'s History'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, TutorHistory.id);
                  },
                  child: const Text('Course\'s Requests'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
