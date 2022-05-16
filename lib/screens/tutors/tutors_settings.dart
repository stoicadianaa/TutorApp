import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutor_app/screens/tutors/tutors_create_course.dart';

class TutorsSettings extends StatefulWidget {
  static final id = 'tutors-settings';

  @override
  _TutorsSettingsState createState() => _TutorsSettingsState();
}

class _TutorsSettingsState extends State<TutorsSettings> {
  late User loggedInUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutor\'s Settings'),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                TextButton(
                  child: Row(
                    children: const [
                      Icon(Icons.add),
                      Text('Create new course'),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, CreateCourse.id);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}