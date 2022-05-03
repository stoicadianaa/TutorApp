import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tutor_app/screens/tutors/user.dart';
import 'package:tutor_app/screens/tutors/user_preferences.dart';
import 'package:tutor_app/screens/tutors/widgets/Button_widget.dart';
import 'package:tutor_app/screens/tutors/widgets/Numbers_widget.dart';
import 'package:tutor_app/screens/tutors/widgets/Profile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TutorProfile extends StatefulWidget {
  static final id = 'tutor-profile';
  String description = '';

  @override
  _TutorProfileState createState() => _TutorProfileState();
}

class _TutorProfileState extends State<TutorProfile> {
  String description = '';
  String name = '';
  final firestore = FirebaseFirestore.instance;
  String userType = 'null';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Tutor\'s Profile')),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
          Center(child: buildUpgradeButton()),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            'Name',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                name = value;
              },
            ),
          )
        ],
      );
  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Save profile',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                description = value;
              },
            )
          ],
        ),
      );
}
