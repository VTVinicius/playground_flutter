import '../../../core/network.dart';
import '../model/AddressResponse.dart';

class ViaCepDataSource {
  ViaCepDataSource(this.networkManager);

  static const String viacepurl = 'https://viacep.com.br/ws/';

  final NetworkManager networkManager;

  Future<AddressResponse> getAddress(String cep) async {
    final response =
        await networkManager.request(RequestMethod.get, '$viacepurl$cep/json/');

    final data = AddressResponse.fromJson(response.data);

    return data;
  }
}
