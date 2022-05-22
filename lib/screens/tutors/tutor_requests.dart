import 'package:flutter/material.dart';

class TutorRequests extends StatefulWidget {
  const TutorRequests({Key? key}) : super(key: key);

  static String id = 'tutor-requests';

  @override
  State<TutorRequests> createState() => _TutorRequestsState();
}

class _TutorRequestsState extends State<TutorRequests> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
      ),
    );
  }
}
