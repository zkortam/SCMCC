import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Banner" field.
  String? _banner;
  String get banner => _banner ?? '';
  bool hasBanner() => _banner != null;

  // "Details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "Registrants" field.
  List<DocumentReference>? _registrants;
  List<DocumentReference> get registrants => _registrants ?? const [];
  bool hasRegistrants() => _registrants != null;

  // "ConfirmedAttendees" field.
  List<DocumentReference>? _confirmedAttendees;
  List<DocumentReference> get confirmedAttendees =>
      _confirmedAttendees ?? const [];
  bool hasConfirmedAttendees() => _confirmedAttendees != null;

  // "PointValue" field.
  int? _pointValue;
  int get pointValue => _pointValue ?? 0;
  bool hasPointValue() => _pointValue != null;

  // "StartTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "EndTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "Code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "RSVPbyTime" field.
  DateTime? _rSVPbyTime;
  DateTime? get rSVPbyTime => _rSVPbyTime;
  bool hasRSVPbyTime() => _rSVPbyTime != null;

  // "EventType" field.
  String? _eventType;
  String get eventType => _eventType ?? '';
  bool hasEventType() => _eventType != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _banner = snapshotData['Banner'] as String?;
    _details = snapshotData['Details'] as String?;
    _registrants = getDataList(snapshotData['Registrants']);
    _confirmedAttendees = getDataList(snapshotData['ConfirmedAttendees']);
    _pointValue = castToType<int>(snapshotData['PointValue']);
    _startTime = snapshotData['StartTime'] as DateTime?;
    _endTime = snapshotData['EndTime'] as DateTime?;
    _code = castToType<int>(snapshotData['Code']);
    _location = snapshotData['location'] as String?;
    _link = snapshotData['link'] as String?;
    _rSVPbyTime = snapshotData['RSVPbyTime'] as DateTime?;
    _eventType = snapshotData['EventType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? name,
  String? banner,
  String? details,
  int? pointValue,
  DateTime? startTime,
  DateTime? endTime,
  int? code,
  String? location,
  String? link,
  DateTime? rSVPbyTime,
  String? eventType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Banner': banner,
      'Details': details,
      'PointValue': pointValue,
      'StartTime': startTime,
      'EndTime': endTime,
      'Code': code,
      'location': location,
      'link': link,
      'RSVPbyTime': rSVPbyTime,
      'EventType': eventType,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.banner == e2?.banner &&
        e1?.details == e2?.details &&
        listEquality.equals(e1?.registrants, e2?.registrants) &&
        listEquality.equals(e1?.confirmedAttendees, e2?.confirmedAttendees) &&
        e1?.pointValue == e2?.pointValue &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.code == e2?.code &&
        e1?.location == e2?.location &&
        e1?.link == e2?.link &&
        e1?.rSVPbyTime == e2?.rSVPbyTime &&
        e1?.eventType == e2?.eventType;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.banner,
        e?.details,
        e?.registrants,
        e?.confirmedAttendees,
        e?.pointValue,
        e?.startTime,
        e?.endTime,
        e?.code,
        e?.location,
        e?.link,
        e?.rSVPbyTime,
        e?.eventType
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
