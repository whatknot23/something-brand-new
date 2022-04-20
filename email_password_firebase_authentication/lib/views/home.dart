import 'package:email_password_firebase_authentication/views/course_view.dart';
import 'package:email_password_firebase_authentication/views/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'add_new_course.dart';
import 'update_course.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance.getInitialMessage();
    //foreground state
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
      }
      //background state
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print(message.data['path']);
        }
      });
    });
  }

  addNewCourse() {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => AddNewCourse(),
    );
  }

  final Stream<QuerySnapshot> _courseStream =
      FirebaseFirestore.instance.collection('courses').snapshots();

  Future<void> deleteCourse(selectedDocument) {
    return FirebaseFirestore.instance
        .collection("courses")
        .doc(selectedDocument)
        .delete()
        .then((value) => print("course has been deleted"))
        .catchError((error) => print(error));
  }

  Future<void> update(selectedDocumentID, title, description, img) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) =>
          UpdateACourse(selectedDocumentID, title, description, img),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("courses"),
        centerTitle: true,
        backgroundColor: Colors.amber.withOpacity(0.2),
        actions: [
          IconButton(onPressed: () => addNewCourse(), icon: Icon(Icons.add))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _courseStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CourseView())),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Container(
                                    width: double.maxFinite,
                                    child: Image.network(
                                      data['img'],
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    data['course_name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(data['course_details']),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          child: Container(
                            width: 120,
                            height: 60,
                            color: Color.fromARGB(0, 26, 35, 31),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color.fromARGB(35, 0, 0, 0),
                                  ),
                                  child: IconButton(
                                    onPressed: () => update(
                                        document.id,
                                        data['course_name'],
                                        data['course_details'],
                                        data['img']),
                                    icon: Icon(Icons.edit, color: Colors.amber),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color.fromARGB(35, 0, 0, 0),
                                  ),
                                  child: IconButton(
                                    onPressed: () => deleteCourse(document.id),
                                    icon: Icon(Icons.remove_circle,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
