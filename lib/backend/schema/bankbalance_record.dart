import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BankbalanceRecord extends FirestoreRecord {
  BankbalanceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "User" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "Balance" field.
  String? _balance;
  String get balance => _balance ?? '';
  bool hasBalance() => _balance != null;

  // "Bankname" field.
  String? _bankname;
  String get bankname => _bankname ?? '';
  bool hasBankname() => _bankname != null;

  // "walletaddress" field.
  String? _walletaddress;
  String get walletaddress => _walletaddress ?? '';
  bool hasWalletaddress() => _walletaddress != null;

  void _initializeFields() {
    _user = snapshotData['User'] as DocumentReference?;
    _balance = snapshotData['Balance'] as String?;
    _bankname = snapshotData['Bankname'] as String?;
    _walletaddress = snapshotData['walletaddress'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Bankbalance');

  static Stream<BankbalanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BankbalanceRecord.fromSnapshot(s));

  static Future<BankbalanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BankbalanceRecord.fromSnapshot(s));

  static BankbalanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BankbalanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BankbalanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BankbalanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BankbalanceRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createBankbalanceRecordData({
  DocumentReference? user,
  String? balance,
  String? bankname,
  String? walletaddress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'User': user,
      'Balance': balance,
      'Bankname': bankname,
      'walletaddress': walletaddress,
    }.withoutNulls,
  );

  return firestoreData;
}
