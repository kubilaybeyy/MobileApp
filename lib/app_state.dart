import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Cart =
          prefs.getStringList('ff_Cart')?.map((path) => path.ref).toList() ??
              _Cart;
    });
    _safeInit(() {
      _totalCart = prefs.getDouble('ff_totalCart') ?? _totalCart;
    });
    _safeInit(() {
      _isOrder = prefs.getBool('ff_isOrder') ?? _isOrder;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _Cart = [];
  List<DocumentReference> get Cart => _Cart;
  set Cart(List<DocumentReference> value) {
    _Cart = value;
    prefs.setStringList('ff_Cart', value.map((x) => x.path).toList());
  }

  void addToCart(DocumentReference value) {
    Cart.add(value);
    prefs.setStringList('ff_Cart', _Cart.map((x) => x.path).toList());
  }

  void removeFromCart(DocumentReference value) {
    Cart.remove(value);
    prefs.setStringList('ff_Cart', _Cart.map((x) => x.path).toList());
  }

  void removeAtIndexFromCart(int index) {
    Cart.removeAt(index);
    prefs.setStringList('ff_Cart', _Cart.map((x) => x.path).toList());
  }

  void updateCartAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    Cart[index] = updateFn(_Cart[index]);
    prefs.setStringList('ff_Cart', _Cart.map((x) => x.path).toList());
  }

  void insertAtIndexInCart(int index, DocumentReference value) {
    Cart.insert(index, value);
    prefs.setStringList('ff_Cart', _Cart.map((x) => x.path).toList());
  }

  double _totalCart = 0.0;
  double get totalCart => _totalCart;
  set totalCart(double value) {
    _totalCart = value;
    prefs.setDouble('ff_totalCart', value);
  }

  bool _isOrder = false;
  bool get isOrder => _isOrder;
  set isOrder(bool value) {
    _isOrder = value;
    prefs.setBool('ff_isOrder', value);
  }

  final _okiManager = StreamRequestManager<List<ProductsRecord>>();
  Stream<List<ProductsRecord>> oki({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProductsRecord>> Function() requestFn,
  }) =>
      _okiManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearOkiCache() => _okiManager.clear();
  void clearOkiCacheKey(String? uniqueKey) =>
      _okiManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
