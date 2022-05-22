import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tutor_app/screens/first_screen.dart';
import 'package:tutor_app/screens/register_screen.dart';
import 'package:tutor_app/screens/main_screen.dart';
import 'package:tutor_app/screens/students/student_history_of_courses.dart';
import 'package:tutor_app/screens/tutors/profile_screen.dart';
import 'package:tutor_app/screens/students/students_register_to_course.dart';
import 'package:tutor_app/screens/tutors/widgets/tutor_history_of_courses.dart';
import 'screens/tutors/tutors_main_screen.dart';
import 'screens/login_screen.dart';
import 'screens/students/students_main_screen.dart';
import 'package:tutor_app/screens/tutors/tutors_settings.dart';
import 'screens/tutors/tutors_create_course.dart';
import 'themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        themeMode: ThemeMode.light,
        home: const FirstScreen(),
        initialRoute: FirstScreen.id,
        routes: {
          FirstScreen.id: (context) => FirstScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          MainScreen.id: (context) => MainScreen(),
          TutorsMainScreen.id: (context) => TutorsMainScreen(),
          StudentsMainScreen.id: (context) => StudentsMainScreen(),
          TutorsSettings.id: (context) => TutorsSettings(),
          CreateCourse.id: (context) => const CreateCourse(),
          RegisterToCourse.id: (context) => RegisterToCourse(),
          StudentHistory.id: (context) => StudentHistory(),
          TutorProfile.id: (context) => TutorProfile(),
          TutorHistory.id: (context) => TutorHistory()
        });
  }
}
