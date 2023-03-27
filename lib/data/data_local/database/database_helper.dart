import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/address_local.dart';

class DatabaseHelper {
  static const _databaseName = "addressDB.db";
  static const _databaseVersion = 1;

  static const table = 'address_table';

  static const columnId = '_id';
  static const columnCEP = 'cep';
  static const columnCidade = 'cidade';
  static const columnUF = 'uf';
  static const columnBairro = 'bairro';
  static const columnRua = 'rua';


  Database? _db;
  Database get db {
    if (_db != null) {
      return _db!;
    } else {
      throw Exception("The database has not been initialized.");
    }
  }

  // Private constructor to prevent direct instantiation
  DatabaseHelper._();

  // Singleton instance
  static final DatabaseHelper instance = DatabaseHelper._();

  // Initialize the database
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
            $columnCidade TEXT,
            $columnUF TEXT,
            $columnBairro TEXT,
            $columnRua TEXT 
          );
          ''');
  }
  
  Future<void> insertAddress(AddressLocal address) async {
    await db.insert(
      table,
      address.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Atualizar um endereço existente no banco de dados
  Future<void> updateAddress(AddressLocal address) async {
    await db.update(
      table,
      address.toJson(),
      where: '$columnCEP = ?',
      whereArgs: [address.toJson()[columnCEP]],
    );
  }

  // Deletar um endereço do banco de dados
  Future<void> deleteAddress(String cep) async {
    await db.delete(
      table,
      where: '$columnCEP = ?',
      whereArgs: [cep],
    );
  }

  // Recuperar todos os endereços do banco de dados
  Future<List<AddressLocal>> getAllAddresses() async {
    final results = await db.query(table);
    return results.map((json) => AddressLocal.fromJson(json)).toList();
  }

  // Recuperar um endereço específico do banco de dados pelo CEP
  Future<Map<String, dynamic>?> getAddressByCep(String cep) async {
    final List<Map<String, dynamic>> maps = await db.query(
      table,
      where: '$columnCEP = ?',
      whereArgs: [cep],
    );

    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      return null;
    }
  }
}
