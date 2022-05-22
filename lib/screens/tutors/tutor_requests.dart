import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'get_requests.dart';

class TutorRequests extends StatefulWidget {
  const TutorRequests({Key? key}) : super(key: key);

  static String id = 'tutor-requests';

  @override
  State<TutorRequests> createState() => _TutorRequestsState();
}

class _TutorRequestsState extends State<TutorRequests> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: listOfRequests.length,
          itemBuilder: (BuildContext context, int index) {
            CourseDetailsCard courseDetailsCard =
                CourseDetailsCard(listOfRequests[index], index);
            return courseDetailsCard;
          },
        ),
      ),
    );
  }
}

class CourseDetailsCard extends StatelessWidget {
  final Requests requestInfo;
  final int index;

  CourseDetailsCard(this.requestInfo, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                  title: Text(requestInfo.title),
                  subtitle: Text(
                      'on ${requestInfo.dayOfTheWeek}s, ${requestInfo.startTime}')),
              Column(
                children: [
                  Text(
                    'student: ${requestInfo.student}',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('users-courses-requests')
                                .doc(
                                    '${requestInfo.student}${requestInfo.title}${requestInfo.dayOfTheWeek}${requestInfo.startTime}')
                                .set({'status-request': 'accepted'});
                          },
                          child: Text('Accept')),
                      TextButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('users-courses-requests')
                                .doc(
                                    '${requestInfo.student}${requestInfo.title}${requestInfo.dayOfTheWeek}${requestInfo.startTime}')
                                .set({'status-request': 'declined'});
                          },
                          child: Text('Reject')),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
