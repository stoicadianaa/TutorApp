import 'package:flutter/material.dart';

import 'package:tutor_app/course.dart';

class StudentsCourseDetails extends StatefulWidget {
  int index;

  StudentsCourseDetails(this.index);

  static final id = 'course-details';

  @override
  _StudentsCourseDetailsState createState() =>
      _StudentsCourseDetailsState(index);
}

class _StudentsCourseDetailsState extends State<StudentsCourseDetails> {
  int index;

  _StudentsCourseDetailsState(this.index);

  @override
  void initState() {
    print(courses[index].dayOfTheWeek.toString());
    super.initState();
  }

  void addStudentToCourse() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course details'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Title: ' + courses[index].title,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Tutor email: ' + courses[index].tutor,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Description: ' + courses[index].description,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Available sesions:',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Container(
                //height: MediaQuery.of(context).size.height - 260,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: courses[index].dayOfTheWeek.length,
                    itemBuilder: (BuildContext context, int numberOfSesion) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                                'Day: every ${courses[index].dayOfTheWeek[numberOfSesion]}'),
                            Text(
                                'Start Time: ${courses[index].startTime[numberOfSesion]} \n End Time: ${courses[index].endTime[numberOfSesion]}'),
                            Text(
                                'Available seats: ${courses[index].maxNumberOfStudents[numberOfSesion]}'),
                            TextButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Request was sent to the ${courses[index].title} on ${courses[index].dayOfTheWeek[numberOfSesion]} at ${courses[index].startTime[numberOfSesion]}.')));
                                },
                                child: const Text('Register this course')),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
