import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String linkUPI(
  String nameofreceiver,
  String upiid,
  String amount,
) {
  return ('https://ptprashanttripathi.github.io/linkpe/?pa=' +
      upiid +
      '&pn=' +
      nameofreceiver +
      'nameofreceiver&amt=' +
      amount);
}

String? upiintentlink(
  String upiid,
  String phonenumber,
  double amount,
  int transactionref,
) {
  var sign = 'default040bae81ede64a66b073d28502b06d9c';

  return ('upi://pay?pa=$upiid&pn=$phonenumber&tr=$transactionref&am=$amount&cu=INR&mc=0000&mode=02&purpose=00');
}

bool checkinvite(String code) {
  if (code == 'INV175E') {
    return (true);
  } else {
    return (false);
  }
}
