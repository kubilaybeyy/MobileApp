import '/backend/backend.dart';
import '/component/products/products_widget.dart';
import '/components/loading_animation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_model.dart';
export 'menu_model.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    super.key,
    required this.code,
  });

  final String? code;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  late MenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: isWeb ? 393.0 : MediaQuery.sizeOf(context).width,
              height: isWeb ? 852.0 : MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 40.0),
                    child: StreamBuilder<List<ProductsRecord>>(
                      stream: FFAppState().oki(
                        requestFn: () => queryProductsRecord(
                          queryBuilder: (productsRecord) =>
                              productsRecord.where(
                            'id',
                            isEqualTo: widget!.code,
                          ),
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<ProductsRecord> staggeredViewProductsRecordList =
                            snapshot.data!;

                        return MasonryGridView.builder(
                          gridDelegate:
                              SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          crossAxisSpacing: 0.0,
                          itemCount: staggeredViewProductsRecordList.length,
                          itemBuilder: (context, staggeredViewIndex) {
                            final staggeredViewProductsRecord =
                                staggeredViewProductsRecordList[
                                    staggeredViewIndex];
                            return Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: ProductsWidget(
                                key: Key(
                                    'Keyjp2_${staggeredViewIndex}_of_${staggeredViewProductsRecordList.length}'),
                                img: staggeredViewProductsRecord.img,
                                name: staggeredViewProductsRecord.name,
                                price: staggeredViewProductsRecord.price,
                                description:
                                    staggeredViewProductsRecord.description,
                                ref: staggeredViewProductsRecord.reference,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Menu',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        fontSize: 25.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 25.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'Cart',
                                    queryParameters: {
                                      'code': serializeParam(
                                        widget!.code,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: badges.Badge(
                                  badgeContent: Text(
                                    FFAppState().Cart.length.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  showBadge: FFAppState().Cart.length != 0,
                                  shape: badges.BadgeShape.circle,
                                  badgeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  elevation: 4.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  position: badges.BadgePosition.topEnd(),
                                  animationType:
                                      badges.BadgeAnimationType.scale,
                                  toAnimate: true,
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (FFAppState().isOrder)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.loadingAnimationModel,
                        updateCallback: () => safeSetState(() {}),
                        child: LoadingAnimationWidget(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
