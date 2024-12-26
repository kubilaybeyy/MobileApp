import '/backend/backend.dart';
import '/component/products/products_widget.dart';
import '/components/loading_animation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'menu_widget.dart' show MenuWidget;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuModel extends FlutterFlowModel<MenuWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LoadingAnimation component.
  late LoadingAnimationModel loadingAnimationModel;

  @override
  void initState(BuildContext context) {
    loadingAnimationModel = createModel(context, () => LoadingAnimationModel());
  }

  @override
  void dispose() {
    loadingAnimationModel.dispose();
  }
}
