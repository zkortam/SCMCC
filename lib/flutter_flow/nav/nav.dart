import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomeWidget() : const EntryWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const HomeWidget() : const EntryWidget(),
        ),
        FFRoute(
          name: 'Entry',
          path: '/entry',
          builder: (context, params) => const EntryWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          requireAuth: true,
          builder: (context, params) => const HomeWidget(),
        ),
        FFRoute(
          name: 'CreateAccount',
          path: '/createAccount',
          requireAuth: true,
          builder: (context, params) => const CreateAccountWidget(),
        ),
        FFRoute(
          name: 'admin',
          path: '/admin',
          requireAuth: true,
          builder: (context, params) => const AdminWidget(),
        ),
        FFRoute(
          name: 'emailSignUp',
          path: '/emailSignUp',
          builder: (context, params) => const EmailSignUpWidget(),
        ),
        FFRoute(
          name: 'emailLogin',
          path: '/emailLogIn',
          builder: (context, params) => EmailLoginWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'forgotPassword',
          path: '/forgotPassword',
          builder: (context, params) => const ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'Welcome',
          path: '/welcome',
          builder: (context, params) => const WelcomeWidget(),
        ),
        FFRoute(
          name: 'Media',
          path: '/media',
          builder: (context, params) => const MediaWidget(),
        ),
        FFRoute(
          name: 'Jobs',
          path: '/jobs',
          builder: (context, params) => const JobsWidget(),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => ProfileWidget(
            userReference: params.getParam(
              'userReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'singleMedia',
          path: '/singleMedia',
          asyncParams: {
            'media': getDoc(['Media'], MediaRecord.fromSnapshot),
          },
          builder: (context, params) => SingleMediaWidget(
            media: params.getParam(
              'media',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'singleJob',
          path: '/singleJob',
          asyncParams: {
            'job': getDoc(['Jobs'], JobsRecord.fromSnapshot),
          },
          builder: (context, params) => SingleJobWidget(
            job: params.getParam(
              'job',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'announcements',
          path: '/announcements',
          builder: (context, params) => const AnnouncementsWidget(),
        ),
        FFRoute(
          name: 'directory',
          path: '/directory',
          builder: (context, params) => const DirectoryWidget(),
        ),
        FFRoute(
          name: 'prayerTimes',
          path: '/prayerTimes',
          requireAuth: true,
          builder: (context, params) => const PrayerTimesWidget(),
        ),
        FFRoute(
          name: 'createEpisode',
          path: '/createEpisode',
          builder: (context, params) => CreateEpisodeWidget(
            media: params.getParam(
              'media',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Media'],
            ),
          ),
        ),
        FFRoute(
          name: 'createEvents',
          path: '/createEvents',
          builder: (context, params) => const CreateEventsWidget(),
        ),
        FFRoute(
          name: 'createAnnouncement',
          path: '/createAnnouncement',
          builder: (context, params) => const CreateAnnouncementWidget(),
        ),
        FFRoute(
          name: 'createJobs',
          path: '/createJobs',
          builder: (context, params) => const CreateJobsWidget(),
        ),
        FFRoute(
          name: 'createMedia',
          path: '/createMedia',
          builder: (context, params) => const CreateMediaWidget(),
        ),
        FFRoute(
          name: 'editEpisode',
          path: '/editEpisode',
          asyncParams: {
            'mediaDoc': getDoc(['Media'], MediaRecord.fromSnapshot),
          },
          builder: (context, params) => EditEpisodeWidget(
            media: params.getParam(
              'media',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Media'],
            ),
            episodeNumber: params.getParam(
              'episodeNumber',
              ParamType.int,
            ),
            mediaDoc: params.getParam(
              'mediaDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'editJobs',
          path: '/editJobs',
          asyncParams: {
            'job': getDoc(['Jobs'], JobsRecord.fromSnapshot),
          },
          builder: (context, params) => EditJobsWidget(
            job: params.getParam(
              'job',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'editMedia',
          path: '/editMedia',
          asyncParams: {
            'media': getDoc(['Media'], MediaRecord.fromSnapshot),
          },
          builder: (context, params) => EditMediaWidget(
            media: params.getParam(
              'media',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'manageJobs',
          path: '/manageJobs',
          builder: (context, params) => const ManageJobsWidget(),
        ),
        FFRoute(
          name: 'manageMedia',
          path: '/manageMedia',
          builder: (context, params) => const ManageMediaWidget(),
        ),
        FFRoute(
          name: 'singleApplicant',
          path: '/singleApplicant',
          asyncParams: {
            'user': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => SingleApplicantWidget(
            user: params.getParam(
              'user',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Events',
          path: '/events',
          builder: (context, params) => const EventsWidget(),
        ),
        FFRoute(
          name: 'singleEvent',
          path: '/singleEvent',
          builder: (context, params) => const SingleEventWidget(),
        ),
        FFRoute(
          name: 'EventPage',
          path: '/eventPage',
          builder: (context, params) => EventPageWidget(
            id: params.getParam(
              'id',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Events'],
            ),
          ),
        ),
        FFRoute(
          name: 'leaderboard',
          path: '/leaderboard',
          builder: (context, params) => const LeaderboardWidget(),
        ),
        FFRoute(
          name: 'resources',
          path: '/resources',
          builder: (context, params) => const ResourcesWidget(),
        ),
        FFRoute(
          name: 'createResource',
          path: '/createResource',
          builder: (context, params) => const CreateResourceWidget(),
        ),
        FFRoute(
          name: 'manageEvents',
          path: '/manageEvents',
          builder: (context, params) => const ManageEventsWidget(),
        ),
        FFRoute(
          name: 'editEvent',
          path: '/editEvent',
          asyncParams: {
            'events': getDoc(['Events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => EditEventWidget(
            events: params.getParam(
              'events',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'community',
          path: '/community',
          builder: (context, params) => const CommunityWidget(),
        ),
        FFRoute(
          name: 'create',
          path: '/create',
          builder: (context, params) => CreateWidget(
            tabIndex: params.getParam(
              'tabIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'PostsPage',
          path: '/postsPage',
          builder: (context, params) => const PostsPageWidget(),
        ),
        FFRoute(
          name: 'Threads',
          path: '/threads',
          builder: (context, params) => const ThreadsWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/entry';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 300),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
