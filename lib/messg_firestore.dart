import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messg extends StatelessWidget {
  final String messg;
  final String sender;

  Messg(this.messg, this.sender);
  wtf() {
    print("object");
    addUser();
  }


  CollectionReference users = FirebaseFirestore.instance.collection('messages');

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'messg': messg, // John Doe
          "sender":sender     
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    /* CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'name': name, // John Doe
            'mobileNo': mobileNo, // Stokes and Sons
         
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
*/
    return  Center(child: wtf());
     /*TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );  */
  }
}
