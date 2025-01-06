import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primary,
          child: Center(
            child: Image.asset(
              'assets/images/Untitled_design-7.png',
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Entry': ParameterData.none(),
  'Home': ParameterData.none(),
  'CreateAccount': ParameterData.none(),
  'admin': ParameterData.none(),
  'emailSignUp': ParameterData.none(),
  'emailLogin': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'forgotPassword': ParameterData.none(),
  'Welcome': ParameterData.none(),
  'Media': ParameterData.none(),
  'Jobs': ParameterData.none(),
  'Profile': (data) async => ParameterData(
        allParams: {
          'userReference':
              getParameter<DocumentReference>(data, 'userReference'),
        },
      ),
  'singleMedia': (data) async => ParameterData(
        allParams: {
          'media': await getDocumentParameter<MediaRecord>(
              data, 'media', MediaRecord.fromSnapshot),
        },
      ),
  'singleJob': (data) async => ParameterData(
        allParams: {
          'job': await getDocumentParameter<JobsRecord>(
              data, 'job', JobsRecord.fromSnapshot),
        },
      ),
  'announcements': ParameterData.none(),
  'directory': ParameterData.none(),
  'prayerTimes': ParameterData.none(),
  'createEpisode': (data) async => ParameterData(
        allParams: {
          'media': getParameter<DocumentReference>(data, 'media'),
        },
      ),
  'createEvents': ParameterData.none(),
  'createAnnouncement': ParameterData.none(),
  'createJobs': ParameterData.none(),
  'createMedia': ParameterData.none(),
  'editEpisode': (data) async => ParameterData(
        allParams: {
          'media': getParameter<DocumentReference>(data, 'media'),
          'episodeNumber': getParameter<int>(data, 'episodeNumber'),
          'mediaDoc': await getDocumentParameter<MediaRecord>(
              data, 'mediaDoc', MediaRecord.fromSnapshot),
        },
      ),
  'editJobs': (data) async => ParameterData(
        allParams: {
          'job': await getDocumentParameter<JobsRecord>(
              data, 'job', JobsRecord.fromSnapshot),
        },
      ),
  'editMedia': (data) async => ParameterData(
        allParams: {
          'media': await getDocumentParameter<MediaRecord>(
              data, 'media', MediaRecord.fromSnapshot),
        },
      ),
  'manageJobs': ParameterData.none(),
  'manageMedia': ParameterData.none(),
  'singleApplicant': (data) async => ParameterData(
        allParams: {
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.fromSnapshot),
        },
      ),
  'Events': ParameterData.none(),
  'singleEvent': ParameterData.none(),
  'EventPage': (data) async => ParameterData(
        allParams: {
          'id': getParameter<DocumentReference>(data, 'id'),
        },
      ),
  'leaderboard': ParameterData.none(),
  'resources': ParameterData.none(),
  'createResource': ParameterData.none(),
  'manageEvents': ParameterData.none(),
  'editEvent': (data) async => ParameterData(
        allParams: {
          'events': await getDocumentParameter<EventsRecord>(
              data, 'events', EventsRecord.fromSnapshot),
        },
      ),
  'community': ParameterData.none(),
  'create': (data) async => ParameterData(
        allParams: {
          'tabIndex': getParameter<int>(data, 'tabIndex'),
        },
      ),
  'PostsPage': ParameterData.none(),
  'Threads': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
