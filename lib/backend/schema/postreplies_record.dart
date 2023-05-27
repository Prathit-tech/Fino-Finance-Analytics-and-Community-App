import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostrepliesRecord extends FirestoreRecord {
  PostrepliesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_photo" field.
  String? _postPhoto;
  String get postPhoto => _postPhoto ?? '';
  bool hasPostPhoto() => _postPhoto != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "num_comments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "num_votes" field.
  int? _numVotes;
  int get numVotes => _numVotes ?? 0;
  bool hasNumVotes() => _numVotes != null;

  // "post_user_name" field.
  String? _postUserName;
  String get postUserName => _postUserName ?? '';
  bool hasPostUserName() => _postUserName != null;

  // "Mainpost" field.
  String? _mainpost;
  String get mainpost => _mainpost ?? '';
  bool hasMainpost() => _mainpost != null;

  // "postreply" field.
  String? _postreply;
  String get postreply => _postreply ?? '';
  bool hasPostreply() => _postreply != null;

  void _initializeFields() {
    _postPhoto = snapshotData['post_photo'] as String?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _numComments = snapshotData['num_comments'] as int?;
    _numVotes = snapshotData['num_votes'] as int?;
    _postUserName = snapshotData['post_user_name'] as String?;
    _mainpost = snapshotData['Mainpost'] as String?;
    _postreply = snapshotData['postreply'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('postreplies');

  static Stream<PostrepliesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostrepliesRecord.fromSnapshot(s));

  static Future<PostrepliesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostrepliesRecord.fromSnapshot(s));

  static PostrepliesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostrepliesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostrepliesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostrepliesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostrepliesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPostrepliesRecordData({
  String? postPhoto,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  int? numVotes,
  String? postUserName,
  String? mainpost,
  String? postreply,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_photo': postPhoto,
      'post_user': postUser,
      'time_posted': timePosted,
      'num_comments': numComments,
      'num_votes': numVotes,
      'post_user_name': postUserName,
      'Mainpost': mainpost,
      'postreply': postreply,
    }.withoutNulls,
  );

  return firestoreData;
}
