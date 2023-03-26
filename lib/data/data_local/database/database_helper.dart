import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

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

  Future<void> insertAddress(Map<String, dynamic> address) async {
    await _db.insert(
      table,
      address,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Atualizar um endereço existente no banco de dados
  Future<void> updateAddress(Map<String, dynamic> address) async {
    await _db.update(
      table,
      address,
      where: '$columnCEP = ?',
      whereArgs: [address[columnCEP]],
    );
  }

  // Deletar um endereço do banco de dados
  Future<void> deleteAddress(String cep) async {
    await _db.delete(
      table,
      where: '$columnCEP = ?',
      whereArgs: [cep],
    );
  }

  // Recuperar todos os endereços do banco de dados
  Future<List<Map<String, dynamic>>> getAllAddresses() async {
    final List<Map<String, dynamic>> maps = await _db.query(table);
    return maps;
  }

  // Recuperar um endereço específico do banco de dados pelo CEP
  Future<Map<String, dynamic>?> getAddressByCep(String cep) async {
    final List<Map<String, dynamic>> maps = await _db.query(
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
