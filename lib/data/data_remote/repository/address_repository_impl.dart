import '../datasource/ViaCepDataSource.dart';
import '../model/AddressResponse.dart';
import 'address_repository.dart';

class AddressRepositoryImpl extends AddressRepository {
  AddressRepositoryImpl({required this.viaCepDataSource});

  final ViaCepDataSource viaCepDataSource;

  @override
  Future<AddressResponse?> getAddress(String cep) async {
    final addressModel = await viaCepDataSource.getAddress(cep);

    return addressModel;
  }
}
