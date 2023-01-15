import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CaptureProfile extends StatefulWidget {
  CaptureProfile({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  State<CaptureProfile> createState() => _CaptureProfileState();
}

class _CaptureProfileState extends State<CaptureProfile> {
  final ImagePicker _picker = ImagePicker();
  File? imagePicked;

  Future<void> _getImage() async {
    bool? isCamera = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Camera"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("gallery "),
            ),
          ],
        ),
      ),
    );
    if (isCamera == null) return;

    final pickedImage = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    final selectedImage = File(pickedImage!.path);
    setState(() {
      imagePicked = File(selectedImage.path);
    });

    final ref = FirebaseStorage.instance
        .ref()
        .child('User_image')
        .child('${FirebaseAuth.instance.currentUser!.uid}.jpg');

    await ref.putFile(imagePicked!);
    final url = await ref.getDownloadURL();

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({'imageUrl': url}, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage: const AssetImage('assets/logo/profile.png'),
          // radius: 40,
          maxRadius: 50,
          minRadius: 30,
          foregroundImage: NetworkImage(widget.imageUrl),
          // imagePicked == null
          //     ? null
          //     : FileImage(
          //         imagePicked!,
          //       )
        ),
        Positioned(
          bottom: -10,
          right: -10,
          child: IconButton(
            onPressed: _getImage,
            icon: const Icon(
              Icons.photo_camera_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
