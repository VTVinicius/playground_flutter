import 'package:playground_flutter/data/data_local/model/address_local.dart';

import 'database_helper.dart';

class AddressDAO {
  AddressDAO(this.databaseHelper);

  static const String viacepurl = 'https://viacep.com.br/ws/';

  final DatabaseHelper databaseHelper;

  Future<List<AddressLocal?>> getAllAddresses() async {
    final response = await databaseHelper.getAllAddresses();

    return response;
  }

  Future insertAddress(AddressLocal address) async {
    final response = await databaseHelper.insertAddress(address);

    return response;
  }
}
