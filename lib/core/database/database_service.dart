import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_provider.dart';

class DataBaseService extends DataBaseProvider {
  static late Database database;
  //* Database provider implementation
  //============================================================================

//? To initialize the database.
  Future<void> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    database = await open(path: join(databasesPath, 'database.db'));
  }

  //? To delete an item or a row in the database.
  @override
  Future<int> delete(
      {required dynamic id,
      required Database db,
      required String tableName,
      String? columnIdTitle}) async {
    try {
      return await db
          .delete(tableName, where: '$columnIdTitle = ?', whereArgs: [id]);
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }

//============================================================================

//? To get the data in the database.
  @override
  Future<List<Map<String, Object?>>> getData({
    dynamic id,
    required Database db,
    required String tableName,
    String? columnIdTitle,
    List<String>? searchByColumns,
  }) async {
    try {
      return await db.query(tableName,
          columns: searchByColumns == null || searchByColumns.isEmpty
              ? null
              : searchByColumns,
          where: columnIdTitle == null ? null : '$columnIdTitle = ?',
          whereArgs: id == null ? null : [id]);
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }

//============================================================================

//? To insert new item in the database.
  @override
  Future insert({
    required Map<String, Object?> item,
    required Database db,
    required String tableName,
  }) async {
    try {
      return await db.insert(tableName, item,
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }

//============================================================================

//? To open an existing database or create a new one.
  @override
  Future<Database> open({
    required String path,
  }) async {
    try {
      Database db = await openDatabase(path, version: 1);
      return db;
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }

//============================================================================

//? To create a new table in the database.
  @override
  Future<void> createTable({
    required Database db,
    required String tableName,
    required String tableBody,
    String? columnIdTitle,
  }) async {
    try {
      await db.execute('''
    create table $tableName ( 
    $columnIdTitle INTEGER primary key autoincrement, 
    $tableBody
        )
    ''');
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }
//============================================================================

//? To update an item or a row in the database.
  @override
  Future<int> update(
      {required Map<String, Object?> item,
      required Database db,
      required String tableName,
      dynamic id,
      String? columnIdTitle}) async {
    try {
      return await db.update(tableName, item,
          where: '$columnIdTitle = ?', whereArgs: [id]);
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }
  //===========================================================================
}
