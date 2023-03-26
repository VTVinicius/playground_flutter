import 'package:playground_flutter/data/data_local/model/address_local.dart';

import 'database_helper.dart';

class AddressDAO {
  AddressDAO(this.databaseHelper);

  static const String viacepurl = 'https://viacep.com.br/ws/';

  final DatabaseHelper databaseHelper;

  Future<List<AddressLocal>> getAllAddresses() async {
    final List<Map<String, dynamic>> response =
        await databaseHelper.getAllAddresses();

    // Mapear a lista de objetos Map<String, dynamic> para uma lista de objetos AddressLocal usando o construtor fromJson
    List<AddressLocal> addresses =
        response.map((json) => AddressLocal.fromJson(json)).toList();

    return addresses;
  }

  Future insertAddress(AddressLocal address) async {
    final response = await databaseHelper.insertAddress(address.toJson());

    return response;
  }
}
