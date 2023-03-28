import 'package:playground_flutter/data/data_local/shared_preferences/datasource/address_preferences_repository.dart';

import '../../core/domain_exceptions.dart';
import '../../core/usecase.dart';

class SaveCEPParams {
  final String? cep;

  const SaveCEPParams(this.cep);
}

class SaveLastCEPUseCase extends UseCase<void, SaveCEPParams> {
  final AddressPreferencesRepository repository;

  const SaveLastCEPUseCase(this.repository);

  @override
  Future run(SaveCEPParams params) {
    if (params.cep == null) {
      throw TypeError();
    } else if (params.cep!.trim().isEmpty) {
      throw MissingParamsException();
    } else {
      return repository.saveLastCEP(params.cep!);
    }
  }
}
