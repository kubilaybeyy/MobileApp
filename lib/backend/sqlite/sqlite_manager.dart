import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      's_qlite_d_b',
      'SQliteDB.db',
    );
  }

  /// START READ QUERY CALLS

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future veriEkle({
    String? name,
    int? price,
    String? description,
  }) =>
      performVeriEkle(
        _database,
        name: name,
        price: price,
        description: description,
      );

  /// END UPDATE QUERY CALLS
}
