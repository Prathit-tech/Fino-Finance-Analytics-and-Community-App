import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "FullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "wallet_address" field.
  String? _walletAddress;
  String get walletAddress => _walletAddress ?? '';
  bool hasWalletAddress() => _walletAddress != null;

  // "userpoints" field.
  double? _userpoints;
  double get userpoints => _userpoints ?? 0.0;
  bool hasUserpoints() => _userpoints != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  void _initializeFields() {
    _password = snapshotData['Password'] as String?;
    _fullName = snapshotData['FullName'] as String?;
    _uid = snapshotData['uid'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _walletAddress = snapshotData['wallet_address'] as String?;
    _userpoints = castToType<double>(snapshotData['userpoints']);
    _photoUrl = snapshotData['photo_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createUsersRecordData({
  String? password,
  String? fullName,
  String? uid,
  String? email,
  String? displayName,
  DateTime? createdTime,
  String? phoneNumber,
  String? walletAddress,
  double? userpoints,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Password': password,
      'FullName': fullName,
      'uid': uid,
      'email': email,
      'display_name': displayName,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'wallet_address': walletAddress,
      'userpoints': userpoints,
      'photo_url': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}
