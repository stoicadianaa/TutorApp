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
        body: Column(
          children: [
            Center(
              child: MaterialButton(
                padding: const EdgeInsets.symmetric(vertical: 4),
                onPressed: () {},
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '4.5',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Rating',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
