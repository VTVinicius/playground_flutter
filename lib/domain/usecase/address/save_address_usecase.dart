
import 'package:playground_flutter/data/data_local/datasource/address_local_repository.dart';
import 'package:playground_flutter/data/data_remote/model/AddressResponse.dart';

import '../../../data/data_local/model/address_local.dart';
import '../../core/domain_exceptions.dart';
import '../../core/usecase.dart';

class SaveAddressParam {
  final AddressResponse address;

  const SaveAddressParam(this.address);
}

class SaveAddressUseCase extends UseCase<void, SaveAddressParam> {
  final AddressLocalRepository repository;

  const SaveAddressUseCase(this.repository);

  @override
  Future run(SaveAddressParam params) {
    if (params == null) {
      throw TypeError();
    } else if (params.address.cep.trim().isEmpty) {
      throw MissingParamsException();
    } else {
      return repository.saveAddress(fromAddressResponse(params.address));
    }
  }

  static AddressLocal fromAddressResponse(AddressResponse response) {
    return AddressLocal(
      id: 0, // Defina um ID padrão ou passe como parâmetro se necessário
      cep: response.cep,
      cidade: response.localidade,
      uf: response.uf,
      bairro: response.bairro,
      rua: response.logradouro,
    );
  }
}
