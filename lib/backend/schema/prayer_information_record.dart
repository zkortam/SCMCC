import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrayerInformationRecord extends FirestoreRecord {
  PrayerInformationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "FajrTime" field.
  DateTime? _fajrTime;
  DateTime? get fajrTime => _fajrTime;
  bool hasFajrTime() => _fajrTime != null;

  // "DuhrTIme" field.
  DateTime? _duhrTIme;
  DateTime? get duhrTIme => _duhrTIme;
  bool hasDuhrTIme() => _duhrTIme != null;

  // "AsrTime" field.
  DateTime? _asrTime;
  DateTime? get asrTime => _asrTime;
  bool hasAsrTime() => _asrTime != null;

  // "MaghribTime" field.
  DateTime? _maghribTime;
  DateTime? get maghribTime => _maghribTime;
  bool hasMaghribTime() => _maghribTime != null;

  // "IshaTime" field.
  DateTime? _ishaTime;
  DateTime? get ishaTime => _ishaTime;
  bool hasIshaTime() => _ishaTime != null;

  // "JumaaTime" field.
  DateTime? _jumaaTime;
  DateTime? get jumaaTime => _jumaaTime;
  bool hasJumaaTime() => _jumaaTime != null;

  // "JumaaKhateeb" field.
  String? _jumaaKhateeb;
  String get jumaaKhateeb => _jumaaKhateeb ?? '';
  bool hasJumaaKhateeb() => _jumaaKhateeb != null;

  // "Musalla" field.
  String? _musalla;
  String get musalla => _musalla ?? '';
  bool hasMusalla() => _musalla != null;

  // "lastTimeUpdated" field.
  DateTime? _lastTimeUpdated;
  DateTime? get lastTimeUpdated => _lastTimeUpdated;
  bool hasLastTimeUpdated() => _lastTimeUpdated != null;

  // "attendees" field.
  List<AttendeeRecordsStruct>? _attendees;
  List<AttendeeRecordsStruct> get attendees => _attendees ?? const [];
  bool hasAttendees() => _attendees != null;

  // "JumaaTime2" field.
  DateTime? _jumaaTime2;
  DateTime? get jumaaTime2 => _jumaaTime2;
  bool hasJumaaTime2() => _jumaaTime2 != null;

  // "JumaaKhateeb2" field.
  String? _jumaaKhateeb2;
  String get jumaaKhateeb2 => _jumaaKhateeb2 ?? '';
  bool hasJumaaKhateeb2() => _jumaaKhateeb2 != null;

  void _initializeFields() {
    _fajrTime = snapshotData['FajrTime'] as DateTime?;
    _duhrTIme = snapshotData['DuhrTIme'] as DateTime?;
    _asrTime = snapshotData['AsrTime'] as DateTime?;
    _maghribTime = snapshotData['MaghribTime'] as DateTime?;
    _ishaTime = snapshotData['IshaTime'] as DateTime?;
    _jumaaTime = snapshotData['JumaaTime'] as DateTime?;
    _jumaaKhateeb = snapshotData['JumaaKhateeb'] as String?;
    _musalla = snapshotData['Musalla'] as String?;
    _lastTimeUpdated = snapshotData['lastTimeUpdated'] as DateTime?;
    _attendees = getStructList(
      snapshotData['attendees'],
      AttendeeRecordsStruct.fromMap,
    );
    _jumaaTime2 = snapshotData['JumaaTime2'] as DateTime?;
    _jumaaKhateeb2 = snapshotData['JumaaKhateeb2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Prayer_Information');

  static Stream<PrayerInformationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PrayerInformationRecord.fromSnapshot(s));

  static Future<PrayerInformationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PrayerInformationRecord.fromSnapshot(s));

  static PrayerInformationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrayerInformationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrayerInformationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrayerInformationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrayerInformationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrayerInformationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrayerInformationRecordData({
  DateTime? fajrTime,
  DateTime? duhrTIme,
  DateTime? asrTime,
  DateTime? maghribTime,
  DateTime? ishaTime,
  DateTime? jumaaTime,
  String? jumaaKhateeb,
  String? musalla,
  DateTime? lastTimeUpdated,
  DateTime? jumaaTime2,
  String? jumaaKhateeb2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'FajrTime': fajrTime,
      'DuhrTIme': duhrTIme,
      'AsrTime': asrTime,
      'MaghribTime': maghribTime,
      'IshaTime': ishaTime,
      'JumaaTime': jumaaTime,
      'JumaaKhateeb': jumaaKhateeb,
      'Musalla': musalla,
      'lastTimeUpdated': lastTimeUpdated,
      'JumaaTime2': jumaaTime2,
      'JumaaKhateeb2': jumaaKhateeb2,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrayerInformationRecordDocumentEquality
    implements Equality<PrayerInformationRecord> {
  const PrayerInformationRecordDocumentEquality();

  @override
  bool equals(PrayerInformationRecord? e1, PrayerInformationRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fajrTime == e2?.fajrTime &&
        e1?.duhrTIme == e2?.duhrTIme &&
        e1?.asrTime == e2?.asrTime &&
        e1?.maghribTime == e2?.maghribTime &&
        e1?.ishaTime == e2?.ishaTime &&
        e1?.jumaaTime == e2?.jumaaTime &&
        e1?.jumaaKhateeb == e2?.jumaaKhateeb &&
        e1?.musalla == e2?.musalla &&
        e1?.lastTimeUpdated == e2?.lastTimeUpdated &&
        listEquality.equals(e1?.attendees, e2?.attendees) &&
        e1?.jumaaTime2 == e2?.jumaaTime2 &&
        e1?.jumaaKhateeb2 == e2?.jumaaKhateeb2;
  }

  @override
  int hash(PrayerInformationRecord? e) => const ListEquality().hash([
        e?.fajrTime,
        e?.duhrTIme,
        e?.asrTime,
        e?.maghribTime,
        e?.ishaTime,
        e?.jumaaTime,
        e?.jumaaKhateeb,
        e?.musalla,
        e?.lastTimeUpdated,
        e?.attendees,
        e?.jumaaTime2,
        e?.jumaaKhateeb2
      ]);

  @override
  bool isValidKey(Object? o) => o is PrayerInformationRecord;
}
