import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/order/order_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'orders_model.dart';
export 'orders_model.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({super.key});

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  late OrdersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersModel());

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
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'You don\'t have any orders yet!',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: StreamBuilder<List<OrdersRecord>>(
                  stream: queryOrdersRecord(
                    queryBuilder: (ordersRecord) => ordersRecord
                        .where(
                          'cafeID',
                          isEqualTo: currentUserUid,
                        )
                        .orderBy('createdDate'),
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
                    List<OrdersRecord> listViewOrdersRecordList =
                        snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        0,
                        0,
                        100.0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewOrdersRecordList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 10.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewOrdersRecord =
                            listViewOrdersRecordList[listViewIndex];
                        return Container(
                          decoration: BoxDecoration(),
                          child: OrderWidget(
                            key: Key(
                                'Keyxw9_${listViewIndex}_of_${listViewOrdersRecordList.length}'),
                            doc: listViewOrdersRecord,
                          ),
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
    );
  }
}
