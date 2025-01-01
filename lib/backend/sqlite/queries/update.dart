import 'package:sqflite/sqflite.dart';

/// BEGIN VERIEKLE
Future performVeriEkle(
  Database database, {
  String? name,
  int? price,
  String? description,
}) {
  final query = '''
INSERT INTO product (name, price, description)
 VALUES ('${name}',${price}, '${description}');
''';
  return database.rawQuery(query);
}

/// END VERIEKLE
