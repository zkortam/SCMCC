// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EpisodeStruct extends FFFirebaseStruct {
  EpisodeStruct({
    int? episodeNumber,
    String? episodeTitle,
    String? episodeDescription,
    String? episodeBanner,
    String? episodeLink,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _episodeNumber = episodeNumber,
        _episodeTitle = episodeTitle,
        _episodeDescription = episodeDescription,
        _episodeBanner = episodeBanner,
        _episodeLink = episodeLink,
        super(firestoreUtilData);

  // "episodeNumber" field.
  int? _episodeNumber;
  int get episodeNumber => _episodeNumber ?? 0;
  set episodeNumber(int? val) => _episodeNumber = val;

  void incrementEpisodeNumber(int amount) =>
      episodeNumber = episodeNumber + amount;

  bool hasEpisodeNumber() => _episodeNumber != null;

  // "episodeTitle" field.
  String? _episodeTitle;
  String get episodeTitle => _episodeTitle ?? '';
  set episodeTitle(String? val) => _episodeTitle = val;

  bool hasEpisodeTitle() => _episodeTitle != null;

  // "episodeDescription" field.
  String? _episodeDescription;
  String get episodeDescription => _episodeDescription ?? '';
  set episodeDescription(String? val) => _episodeDescription = val;

  bool hasEpisodeDescription() => _episodeDescription != null;

  // "episodeBanner" field.
  String? _episodeBanner;
  String get episodeBanner => _episodeBanner ?? '';
  set episodeBanner(String? val) => _episodeBanner = val;

  bool hasEpisodeBanner() => _episodeBanner != null;

  // "episodeLink" field.
  String? _episodeLink;
  String get episodeLink => _episodeLink ?? '';
  set episodeLink(String? val) => _episodeLink = val;

  bool hasEpisodeLink() => _episodeLink != null;

  static EpisodeStruct fromMap(Map<String, dynamic> data) => EpisodeStruct(
        episodeNumber: castToType<int>(data['episodeNumber']),
        episodeTitle: data['episodeTitle'] as String?,
        episodeDescription: data['episodeDescription'] as String?,
        episodeBanner: data['episodeBanner'] as String?,
        episodeLink: data['episodeLink'] as String?,
      );

  static EpisodeStruct? maybeFromMap(dynamic data) =>
      data is Map ? EpisodeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'episodeNumber': _episodeNumber,
        'episodeTitle': _episodeTitle,
        'episodeDescription': _episodeDescription,
        'episodeBanner': _episodeBanner,
        'episodeLink': _episodeLink,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'episodeNumber': serializeParam(
          _episodeNumber,
          ParamType.int,
        ),
        'episodeTitle': serializeParam(
          _episodeTitle,
          ParamType.String,
        ),
        'episodeDescription': serializeParam(
          _episodeDescription,
          ParamType.String,
        ),
        'episodeBanner': serializeParam(
          _episodeBanner,
          ParamType.String,
        ),
        'episodeLink': serializeParam(
          _episodeLink,
          ParamType.String,
        ),
      }.withoutNulls;

  static EpisodeStruct fromSerializableMap(Map<String, dynamic> data) =>
      EpisodeStruct(
        episodeNumber: deserializeParam(
          data['episodeNumber'],
          ParamType.int,
          false,
        ),
        episodeTitle: deserializeParam(
          data['episodeTitle'],
          ParamType.String,
          false,
        ),
        episodeDescription: deserializeParam(
          data['episodeDescription'],
          ParamType.String,
          false,
        ),
        episodeBanner: deserializeParam(
          data['episodeBanner'],
          ParamType.String,
          false,
        ),
        episodeLink: deserializeParam(
          data['episodeLink'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EpisodeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EpisodeStruct &&
        episodeNumber == other.episodeNumber &&
        episodeTitle == other.episodeTitle &&
        episodeDescription == other.episodeDescription &&
        episodeBanner == other.episodeBanner &&
        episodeLink == other.episodeLink;
  }

  @override
  int get hashCode => const ListEquality().hash([
        episodeNumber,
        episodeTitle,
        episodeDescription,
        episodeBanner,
        episodeLink
      ]);
}

EpisodeStruct createEpisodeStruct({
  int? episodeNumber,
  String? episodeTitle,
  String? episodeDescription,
  String? episodeBanner,
  String? episodeLink,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EpisodeStruct(
      episodeNumber: episodeNumber,
      episodeTitle: episodeTitle,
      episodeDescription: episodeDescription,
      episodeBanner: episodeBanner,
      episodeLink: episodeLink,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EpisodeStruct? updateEpisodeStruct(
  EpisodeStruct? episode, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    episode
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEpisodeStructData(
  Map<String, dynamic> firestoreData,
  EpisodeStruct? episode,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (episode == null) {
    return;
  }
  if (episode.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && episode.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final episodeData = getEpisodeFirestoreData(episode, forFieldValue);
  final nestedData = episodeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = episode.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEpisodeFirestoreData(
  EpisodeStruct? episode, [
  bool forFieldValue = false,
]) {
  if (episode == null) {
    return {};
  }
  final firestoreData = mapToFirestore(episode.toMap());

  // Add any Firestore field values
  episode.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEpisodeListFirestoreData(
  List<EpisodeStruct>? episodes,
) =>
    episodes?.map((e) => getEpisodeFirestoreData(e, true)).toList() ?? [];
