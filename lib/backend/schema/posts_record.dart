import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "TimePosted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "Caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  bool hasCaption() => _caption != null;

  // "Author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "Voters" field.
  List<VotersStruct>? _voters;
  List<VotersStruct> get voters => _voters ?? const [];
  bool hasVoters() => _voters != null;

  // "media" field.
  List<String>? _media;
  List<String> get media => _media ?? const [];
  bool hasMedia() => _media != null;

  // "isSpoiler" field.
  bool? _isSpoiler;
  bool get isSpoiler => _isSpoiler ?? false;
  bool hasIsSpoiler() => _isSpoiler != null;

  // "isCommentsAllowed" field.
  bool? _isCommentsAllowed;
  bool get isCommentsAllowed => _isCommentsAllowed ?? false;
  bool hasIsCommentsAllowed() => _isCommentsAllowed != null;

  // "SpoilerClickers" field.
  List<DocumentReference>? _spoilerClickers;
  List<DocumentReference> get spoilerClickers => _spoilerClickers ?? const [];
  bool hasSpoilerClickers() => _spoilerClickers != null;

  // "hashtags" field.
  List<String>? _hashtags;
  List<String> get hashtags => _hashtags ?? const [];
  bool hasHashtags() => _hashtags != null;

  void _initializeFields() {
    _timePosted = snapshotData['TimePosted'] as DateTime?;
    _caption = snapshotData['Caption'] as String?;
    _author = snapshotData['Author'] as DocumentReference?;
    _voters = getStructList(
      snapshotData['Voters'],
      VotersStruct.fromMap,
    );
    _media = getDataList(snapshotData['media']);
    _isSpoiler = snapshotData['isSpoiler'] as bool?;
    _isCommentsAllowed = snapshotData['isCommentsAllowed'] as bool?;
    _spoilerClickers = getDataList(snapshotData['SpoilerClickers']);
    _hashtags = getDataList(snapshotData['hashtags']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  DateTime? timePosted,
  String? caption,
  DocumentReference? author,
  bool? isSpoiler,
  bool? isCommentsAllowed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TimePosted': timePosted,
      'Caption': caption,
      'Author': author,
      'isSpoiler': isSpoiler,
      'isCommentsAllowed': isCommentsAllowed,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timePosted == e2?.timePosted &&
        e1?.caption == e2?.caption &&
        e1?.author == e2?.author &&
        listEquality.equals(e1?.voters, e2?.voters) &&
        listEquality.equals(e1?.media, e2?.media) &&
        e1?.isSpoiler == e2?.isSpoiler &&
        e1?.isCommentsAllowed == e2?.isCommentsAllowed &&
        listEquality.equals(e1?.spoilerClickers, e2?.spoilerClickers) &&
        listEquality.equals(e1?.hashtags, e2?.hashtags);
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.timePosted,
        e?.caption,
        e?.author,
        e?.voters,
        e?.media,
        e?.isSpoiler,
        e?.isCommentsAllowed,
        e?.spoilerClickers,
        e?.hashtags
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
