import 'package:sqflite/sqflite.dart';

abstract class DataBaseProvider {
  //* abstract class for sqflite methotds.
  //==================================================================
  Future<Database> open({
    required String path,
  });
  Future<void> createTable({
    required Database db,
    required String tableName,
    required String tableBody,
    String? columnIdTitle,
  });

  Future<List<Map<String, Object?>>> getData({
    required Database db,
    required dynamic id,
    required String tableName,
    String? columnIdTitle,
    List<String>? searchByColumns,
  });
  Future<int> delete({
    required Database db,
    required dynamic id,
    required String tableName,
    String? columnIdTitle,
  });
  Future<int> update({
    required Database db,
    required Map<String, Object?> item,
    required String tableName,
    String? columnIdTitle,
  });
  Future<dynamic> insert({
    required Database db,
    required Map<String, Object?> item,
    required String tableName,
  });
}
