import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResourcesRecord extends FirestoreRecord {
  ResourcesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "file" field.
  String? _file;
  String get file => _file ?? '';
  bool hasFile() => _file != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _file = snapshotData['file'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resources');

  static Stream<ResourcesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResourcesRecord.fromSnapshot(s));

  static Future<ResourcesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResourcesRecord.fromSnapshot(s));

  static ResourcesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResourcesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResourcesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResourcesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResourcesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResourcesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResourcesRecordData({
  String? name,
  String? image,
  String? file,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'file': file,
      'createdTime': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResourcesRecordDocumentEquality implements Equality<ResourcesRecord> {
  const ResourcesRecordDocumentEquality();

  @override
  bool equals(ResourcesRecord? e1, ResourcesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.file == e2?.file &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(ResourcesRecord? e) =>
      const ListEquality().hash([e?.name, e?.image, e?.file, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is ResourcesRecord;
}
