import '/backend/backend.dart';
import '/components/navigation_bar_widget.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'posts_page_model.dart';
export 'posts_page_model.dart';

class PostsPageWidget extends StatefulWidget {
  const PostsPageWidget({super.key});

  @override
  State<PostsPageWidget> createState() => _PostsPageWidgetState();
}

class _PostsPageWidgetState extends State<PostsPageWidget> {
  late PostsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('announcements');
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 3.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 45.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  icon: Icon(
                                    Icons.arrow_back_sharp,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('community');
                                  },
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'zg7cy8xc' /* Posts */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 45.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.add_rounded,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed(
                                      'create',
                                      queryParameters: {
                                        'tabIndex': serializeParam(
                                          0,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: StreamBuilder<List<PostsRecord>>(
                          stream: queryPostsRecord(
                            queryBuilder: (postsRecord) => postsRecord
                                .orderBy('TimePosted', descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitRipple(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<PostsRecord> listViewPostsRecordList =
                                snapshot.data!;

                            return ListView.separated(
                              padding: const EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                120.0,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewPostsRecordList.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 10.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewPostsRecord =
                                    listViewPostsRecordList[listViewIndex];
                                return PostWidget(
                                  key: Key(
                                      'Key24y_${listViewIndex}_of_${listViewPostsRecordList.length}'),
                                  post: listViewPostsRecord,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: SizedBox(
                  height: 120.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.navigationBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavigationBarWidget(
                            page: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
