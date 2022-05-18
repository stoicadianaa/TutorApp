import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'get_students_courses.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

List<double> ratingValues = List.filled(coursesTaken.length, 0.0);

class StudentHistory extends StatefulWidget {
  const StudentHistory({Key? key}) : super(key: key);

  static String id = 'student-history';

  @override
  State<StudentHistory> createState() => _StudentHistoryState();
}

class _StudentHistoryState extends State<StudentHistory> {
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getCoursesByStudent(_auth.currentUser?.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: coursesTaken.length,
          itemBuilder: (BuildContext context, int index) {

            CourseDetailsCard courseDetailsCard =
            CourseDetailsCard(coursesTaken[index],index);
            return Column(
              children: [
                courseDetailsCard,
                const SizedBox(height: 25),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CourseDetailsCard extends StatefulWidget {
  final RequestInfo requestInfo;
  final int index;

  const CourseDetailsCard(this.requestInfo, this.index);

  @override
  State<CourseDetailsCard> createState() => _CourseDetailsCardState(requestInfo,index);
}

class _CourseDetailsCardState extends State<CourseDetailsCard> {
  final int index;
  final RequestInfo requestInfo;
  
  _CourseDetailsCardState(this.requestInfo, this.index);
  
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
                title: Text(requestInfo.courseName),
                subtitle: Text(
                  'course by ${requestInfo.tutorEmail}\n',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Text(
                'description: ${requestInfo.description}',
              ),
              Text(
                  'on ${requestInfo.dayOfTheWeek}s, ${requestInfo.startTime}-${requestInfo.endTime}'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'request status: ${requestInfo.statusRequest}',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Visibility(
                visible: requestInfo.statusRequest == 'accepted',
                child: Column(
                  children: [
                    const Text(
                      'Rate this course!',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    // implement the rating bar
                    RatingBar(
                        initialRating: 4.5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                            full: const Icon(Icons.star, color: Colors.orange),
                            half: const Icon(
                              Icons.star_half,
                              color: Colors.orange,
                            ),
                            empty: const Icon(
                              Icons.star_outline,
                              color: Colors.orange,
                            )),
                        onRatingUpdate: (value) {
                        }),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
