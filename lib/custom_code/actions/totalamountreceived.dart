// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math' as math;
import '../../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<double> totalamountreceived(String displayname) async {
  // Add your function code here!
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('transaction')
      .where('name', isEqualTo: displayname)
      .get();

  double totalAmount = 0.0; // Use a double variable for totalAmount

// Iterate through the retrieved documents
  querySnapshot.docs.forEach((doc) {
    // Extract the 'amount' and 'status' field values from each document
    double amount = doc['amount'];
    String status = doc['status'];

    // Check the value of the 'status' field and add or subtract the 'amount' accordingly
    if (status == 'sent') {
      totalAmount += 0.0;
    } else if (status == 'received') {
      totalAmount += amount;
    }
  });

// Return the totalAmount as a double value
  return totalAmount;
}
