import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewCourse extends StatefulWidget {
  const AddNewCourse({Key? key}) : super(key: key);

  @override
  State<AddNewCourse> createState() => _AddNewCourseState();
}

TextEditingController _titleController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();
XFile? _courseImage;
String? imageUrl;

class _AddNewCourseState extends State<AddNewCourse> {
  chooseImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    _courseImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  writeData() async {
    File imgFile = File(_courseImage!.path);
    FirebaseStorage _stroage = FirebaseStorage.instance;
    UploadTask _uploadTask =
        _stroage.ref('images').child(_courseImage!.name).putFile(imgFile);

    TaskSnapshot snapshot = await _uploadTask;
    imageUrl = await snapshot.ref.getDownloadURL();
    print(imageUrl);
    CollectionReference _course =
        FirebaseFirestore.instance.collection("courses");
    _course.add({
      'course_name': _titleController.text,
      'course_details': _descriptionController.text,
      'img': imageUrl,
    });
    print("Successfully added");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: "enter course title"),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(hintText: "enter course details"),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Material(
                      child: _courseImage == null
                          ? IconButton(
                              onPressed: () => chooseImageFromGallery(),
                              icon: Icon(Icons.photo),
                            )
                          : Image.file(
                              File(_courseImage!.path),
                              fit: BoxFit.cover,
                            )),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () => writeData(), child: Text("Add new course")),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
