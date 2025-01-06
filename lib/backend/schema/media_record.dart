import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MediaRecord extends FirestoreRecord {
  MediaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "Link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "Banner" field.
  String? _banner;
  String get banner => _banner ?? '';
  bool hasBanner() => _banner != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "clicksInt" field.
  int? _clicksInt;
  int get clicksInt => _clicksInt ?? 0;
  bool hasClicksInt() => _clicksInt != null;

  // "isShow" field.
  bool? _isShow;
  bool get isShow => _isShow ?? false;
  bool hasIsShow() => _isShow != null;

  // "episodes" field.
  List<EpisodeStruct>? _episodes;
  List<EpisodeStruct> get episodes => _episodes ?? const [];
  bool hasEpisodes() => _episodes != null;

  // "clicksTime" field.
  List<DateTime>? _clicksTime;
  List<DateTime> get clicksTime => _clicksTime ?? const [];
  bool hasClicksTime() => _clicksTime != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _description = snapshotData['Description'] as String?;
    _author = snapshotData['Author'] as String?;
    _link = snapshotData['Link'] as String?;
    _banner = snapshotData['Banner'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _category = snapshotData['category'] as String?;
    _clicksInt = castToType<int>(snapshotData['clicksInt']);
    _isShow = snapshotData['isShow'] as bool?;
    _episodes = getStructList(
      snapshotData['episodes'],
      EpisodeStruct.fromMap,
    );
    _clicksTime = getDataList(snapshotData['clicksTime']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Media');

  static Stream<MediaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MediaRecord.fromSnapshot(s));

  static Future<MediaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MediaRecord.fromSnapshot(s));

  static MediaRecord fromSnapshot(DocumentSnapshot snapshot) => MediaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MediaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MediaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MediaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MediaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMediaRecordData({
  String? title,
  String? description,
  String? author,
  String? link,
  String? banner,
  DateTime? time,
  String? category,
  int? clicksInt,
  bool? isShow,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Description': description,
      'Author': author,
      'Link': link,
      'Banner': banner,
      'time': time,
      'category': category,
      'clicksInt': clicksInt,
      'isShow': isShow,
    }.withoutNulls,
  );

  return firestoreData;
}

class MediaRecordDocumentEquality implements Equality<MediaRecord> {
  const MediaRecordDocumentEquality();

  @override
  bool equals(MediaRecord? e1, MediaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.author == e2?.author &&
        e1?.link == e2?.link &&
        e1?.banner == e2?.banner &&
        e1?.time == e2?.time &&
        e1?.category == e2?.category &&
        e1?.clicksInt == e2?.clicksInt &&
        e1?.isShow == e2?.isShow &&
        listEquality.equals(e1?.episodes, e2?.episodes) &&
        listEquality.equals(e1?.clicksTime, e2?.clicksTime);
  }

  @override
  int hash(MediaRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.author,
        e?.link,
        e?.banner,
        e?.time,
        e?.category,
        e?.clicksInt,
        e?.isShow,
        e?.episodes,
        e?.clicksTime
      ]);

  @override
  bool isValidKey(Object? o) => o is MediaRecord;
}
