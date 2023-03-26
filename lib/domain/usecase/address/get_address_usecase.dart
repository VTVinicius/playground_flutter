import '../../../data/data_remote/model/AddressResponse.dart';
import '../../../data/data_remote/repository/address_repository.dart';
import '../../core/domain_exceptions.dart';
import '../../core/usecase.dart';

class GetAddressParam {
  final String cep;

  const GetAddressParam(this.cep);
}

class GetAddressUseCase extends UseCase<AddressResponse?, GetAddressParam> {
  final AddressRepository repository;

  const GetAddressUseCase(this.repository);

  @override
  Future<AddressResponse?> run(GetAddressParam params) {
    if (params == null) {
      throw TypeError();
    } else if (params.cep.trim().isEmpty) {
      throw MissingParamsException();
    } else {
      return repository.getAddress(params.cep);
    }
  }
}
