import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobsRecord extends FirestoreRecord {
  JobsRecord._(
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
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "Applicants" field.
  List<DocumentReference>? _applicants;
  List<DocumentReference> get applicants => _applicants ?? const [];
  bool hasApplicants() => _applicants != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "closeTime" field.
  DateTime? _closeTime;
  DateTime? get closeTime => _closeTime;
  bool hasCloseTime() => _closeTime != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _description = snapshotData['Description'] as String?;
    _author = snapshotData['Author'] as DocumentReference?;
    _applicants = getDataList(snapshotData['Applicants']);
    _time = snapshotData['time'] as DateTime?;
    _closeTime = snapshotData['closeTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Jobs');

  static Stream<JobsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobsRecord.fromSnapshot(s));

  static Future<JobsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobsRecord.fromSnapshot(s));

  static JobsRecord fromSnapshot(DocumentSnapshot snapshot) => JobsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobsRecordData({
  String? title,
  String? description,
  DocumentReference? author,
  DateTime? time,
  DateTime? closeTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Description': description,
      'Author': author,
      'time': time,
      'closeTime': closeTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class JobsRecordDocumentEquality implements Equality<JobsRecord> {
  const JobsRecordDocumentEquality();

  @override
  bool equals(JobsRecord? e1, JobsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.author == e2?.author &&
        listEquality.equals(e1?.applicants, e2?.applicants) &&
        e1?.time == e2?.time &&
        e1?.closeTime == e2?.closeTime;
  }

  @override
  int hash(JobsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.author,
        e?.applicants,
        e?.time,
        e?.closeTime
      ]);

  @override
  bool isValidKey(Object? o) => o is JobsRecord;
}
