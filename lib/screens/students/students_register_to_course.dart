import 'package:flutter/material.dart';


class RegisterToCourse extends StatefulWidget {
  static const id = 'students-register-to-course';

  const RegisterToCourse({Key? key}) : super(key: key);

  @override
  _RegisterToCourseScreenState createState() => _RegisterToCourseScreenState();
}

class _RegisterToCourseScreenState extends State<RegisterToCourse> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Courses'),
      ),
      body: Container(
        color: Colors.white,

      ),
    );
  }
}
