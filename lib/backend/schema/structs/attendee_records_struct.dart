// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AttendeeRecordsStruct extends FFFirebaseStruct {
  AttendeeRecordsStruct({
    String? id,
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _date = date,
        super(firestoreUtilData);

  // "ID" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  static AttendeeRecordsStruct fromMap(Map<String, dynamic> data) =>
      AttendeeRecordsStruct(
        id: data['ID'] as String?,
        date: data['date'] as DateTime?,
      );

  static AttendeeRecordsStruct? maybeFromMap(dynamic data) => data is Map
      ? AttendeeRecordsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID': _id,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID': serializeParam(
          _id,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static AttendeeRecordsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AttendeeRecordsStruct(
        id: deserializeParam(
          data['ID'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'AttendeeRecordsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AttendeeRecordsStruct &&
        id == other.id &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([id, date]);
}

AttendeeRecordsStruct createAttendeeRecordsStruct({
  String? id,
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AttendeeRecordsStruct(
      id: id,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AttendeeRecordsStruct? updateAttendeeRecordsStruct(
  AttendeeRecordsStruct? attendeeRecords, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    attendeeRecords
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAttendeeRecordsStructData(
  Map<String, dynamic> firestoreData,
  AttendeeRecordsStruct? attendeeRecords,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (attendeeRecords == null) {
    return;
  }
  if (attendeeRecords.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && attendeeRecords.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final attendeeRecordsData =
      getAttendeeRecordsFirestoreData(attendeeRecords, forFieldValue);
  final nestedData =
      attendeeRecordsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = attendeeRecords.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAttendeeRecordsFirestoreData(
  AttendeeRecordsStruct? attendeeRecords, [
  bool forFieldValue = false,
]) {
  if (attendeeRecords == null) {
    return {};
  }
  final firestoreData = mapToFirestore(attendeeRecords.toMap());

  // Add any Firestore field values
  attendeeRecords.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAttendeeRecordsListFirestoreData(
  List<AttendeeRecordsStruct>? attendeeRecordss,
) =>
    attendeeRecordss
        ?.map((e) => getAttendeeRecordsFirestoreData(e, true))
        .toList() ??
    [];
