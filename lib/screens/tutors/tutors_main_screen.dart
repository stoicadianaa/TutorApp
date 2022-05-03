import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutor_app/screens/tutors/profile_screen.dart';
import 'package:tutor_app/screens/tutors/tutors_settings.dart';

class TutorsMainScreen extends StatefulWidget {
  TutorsMainScreen({this.message, this.appBarMessage});
  final appBarMessage;
  final message;
  static final id = 'tutors-main';

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
  }

  void getCurrentUser() async {
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
      appBar: AppBar(title: const Text('Tutor\'s Screen'), actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.pushNamed(context, TutorsSettings.id);
          },
        )
      ]),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, TutorProfile.id);
                  },
                  child: Text('CREATE PROFILE'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
