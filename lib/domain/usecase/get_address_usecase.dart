import 'package:playground_flutter/data/repository/address_repository.dart';

import '../../core/usecase.dart';
import '../../data/AddressResponse.dart';
import '../../data/repository/address_repository_impl.dart';

class GetAddressParam {
  final String cep;

  const GetAddressParam(this.cep);
}

class GetAddressUseCase extends UseCase<AddressResponse?, GetAddressParam> {
  final AddressRepository repository;

  const GetAddressUseCase(this.repository);

  @override
  Future<AddressResponse?> run(GetAddressParam params) {
    return repository.getAddress(params.cep);
  }
}
