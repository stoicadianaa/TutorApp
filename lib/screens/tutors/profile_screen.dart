import 'package:flutter/material.dart';

class TutorProfile extends StatefulWidget {
  static const id = 'tutor-profile';

  const TutorProfile({Key? key}) : super(key: key);

  @override
  _TutorProfileState createState() => _TutorProfileState();
}

class _TutorProfileState extends State<TutorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tutor\'s Profile')),
        body: Container());
  }
}
