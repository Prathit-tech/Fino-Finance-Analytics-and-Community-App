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

Future<double> totalamountreceivedmonthly(String displayname) async {
  // Add your function code here!
  DateTime now = DateTime.now();
  DateTime startOfMonth = DateTime(now.year, now.month, now.day);
  DateTime endOfMonth;

  if (now.month == 1) {
    endOfMonth = DateTime(now.year - 1, 12, 1);
  } else {
    endOfMonth = DateTime(now.year, now.month - 1, 1);
  }

  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('transaction')
      .where('name', isEqualTo: displayname)
      .where('timestamp', isGreaterThanOrEqualTo: startOfMonth)
      .where('timestamp', isLessThanOrEqualTo: endOfMonth)
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
