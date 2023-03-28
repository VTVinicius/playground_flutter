import 'package:playground_flutter/data/data_local/shared_preferences/datasource/address_preferences_repository.dart';

import '../../core/usecase.dart';

class GetLastCEPUseCase extends UseCase<String?, void> {
  final AddressPreferencesRepository repository;

  const GetLastCEPUseCase(this.repository);

  @override
  Future<String?> run(void params) {
    return repository.getLastCEP();
  }
}
