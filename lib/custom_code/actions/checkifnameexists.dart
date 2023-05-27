// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> checkifnameexists(String? name) async {
  // Add your function code here!
  try {
    // Get the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Query Firestore for documents in 'Users' collection with matching 'display_name' field
    QuerySnapshot querySnapshot = await firestore
        .collection('Users')
        .where('display_name', isEqualTo: name)
        .get();

    // If querySnapshot contains any documents, it means the name already exists
    return querySnapshot.docs.isNotEmpty;
  } catch (e) {
    // Handle any errors that may occur during Firestore query
    print('Error checking name existence: $e');
    return false;
  }
}
