import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutor_app/screens/tutors/widgets/Profile_widget.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class TutorProfile extends StatefulWidget {
  static const id = 'tutor-profile';

  const TutorProfile({Key? key}) : super(key: key);

  @override
  _TutorProfileState createState() => _TutorProfileState();
}

class _TutorProfileState extends State<TutorProfile> {
  FirebaseStorage storage = FirebaseStorage.instance;
  String description = '';
  String name = '';
  String userType = 'null';
  String myFileUrl =
      "https://w7.pngwing.com/pngs/753/432/png-transparent-user-profile-2018-in-sight-user-conference-expo-business-default-business-angle-service-people.png";
  final _auth = FirebaseAuth.instance;
  late Reference myFile;
  double rating = 0.0;

  @override
  initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      File imageFile = File(pickedImage!.path);

      try {
        // Uploading the selected image with some custom meta data
        await storage.ref('${_auth.currentUser?.email}').putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': 'tutor-user',
              'description': 'Some description...'
            }));

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  void _loadImages() async {
    myFileUrl = '';
    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    myFile = storage.ref(
        'png-transparent-user-profile-2018-in-sight-user-conference-expo-business-default-business-angle-service-people.png');
    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      if (file.fullPath == _auth.currentUser?.email) {
        setState(() {
          myFile = file;
          myFileUrl = fileUrl;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tutor\'s Profile')),
      body: Padding(
        padding: const EdgeInsets.only(top: 26.0),
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              //physics: NeverScrollableScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: myFileUrl,
                  onClicked: () async {
                    setState(() {
                      _upload('gallery');
                      if (myFileUrl == '') {
                        myFileUrl =
                            "https://w7.pngwing.com/pngs/753/432/png-transparent-user-profile-2018-in-sight-user-conference-expo-business-default-business-angle-service-people.png";
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
