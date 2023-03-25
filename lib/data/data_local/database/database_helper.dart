import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../model/address_local.dart';

class DatabaseHelper {
  static const _databaseName = "AddressDB.db";
  static const _databaseVersion = 1;

  static const table = 'address_table';

  static const columnId = '_id';
  static const columnCEP = 'cep';
  static const columnCidade = 'cidade';
  static const columnUF = 'uf';
  static const columnBairro = 'bairro';
  static const columnRua = 'rua';

  late Database _db;

// this opens the database (and creates it if it doesn't exist)
  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

// SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnCEP TEXT PRIMARY KEY,
            $columnCidade TEXT NOT NULL,
            $columnUF TEXT NOT NULL,
            $columnBairro TEXT NOT NULL,
            $columnRua TEXT NOT NULL
          )
          ''');
  }

  Future<void> insertAddress(AddressLocal address) async {
    final Database db = await _db;
    await db.insert(
      table,
      address.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<AddressLocal?>> getAllAddresses() async {
    final Database db = await _db;
    final List<Map<String, dynamic>> maps = await db.query(table);

    return List.generate(maps.length, (i) {
      return AddressLocal.fromMap(maps[i]);
    });
  }

  Future<int> insert(Map<String, dynamic> row) async {
    return await _db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await _db.query(table);
  }

  Future<int> queryRowCount() async {
    final results = await _db.rawQuery('SELECT * FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> update(Map<String, dynamic> row) async {
    String cep = row[columnCEP];
    return await _db.update(
      table,
      row,
      where: '$columnCEP = ?',
      whereArgs: [cep],
    );
  }

  Future<int> delete(String cep) async {
    return await _db.delete(
      table,
      where: '$columnCEP = ?',
      whereArgs: [cep],
    );
  }
}
