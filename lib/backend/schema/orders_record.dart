import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cafeID" field.
  String? _cafeID;
  String get cafeID => _cafeID ?? '';
  bool hasCafeID() => _cafeID != null;

  // "tableNumber" field.
  int? _tableNumber;
  int get tableNumber => _tableNumber ?? 0;
  bool hasTableNumber() => _tableNumber != null;

  // "orderRef" field.
  List<DocumentReference>? _orderRef;
  List<DocumentReference> get orderRef => _orderRef ?? const [];
  bool hasOrderRef() => _orderRef != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  void _initializeFields() {
    _cafeID = snapshotData['cafeID'] as String?;
    _tableNumber = castToType<int>(snapshotData['tableNumber']);
    _orderRef = getDataList(snapshotData['orderRef']);
    _createdDate = snapshotData['createdDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? cafeID,
  int? tableNumber,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cafeID': cafeID,
      'tableNumber': tableNumber,
      'createdDate': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.cafeID == e2?.cafeID &&
        e1?.tableNumber == e2?.tableNumber &&
        listEquality.equals(e1?.orderRef, e2?.orderRef) &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality()
      .hash([e?.cafeID, e?.tableNumber, e?.orderRef, e?.createdDate]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
