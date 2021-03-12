import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Location extends StatelessWidget {
  final String address;
  

  Location(this.address);
  wtf() {
    addUser();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('location');

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'Address': address, // John Doe
        
        })
        .then((value) => print("Location done"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: wtf());
  }
}
