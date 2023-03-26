import 'package:playground_flutter/data/data_local/datasource/address_local_repository.dart';

import '../../../data/data_local/model/address_local.dart';
import '../../core/usecase.dart';

class GetAllAddressesUseCase extends UseCase<List<AddressLocal?>, void> {
  final AddressLocalRepository repository;

  const GetAllAddressesUseCase(this.repository);

  @override
  Future<List<AddressLocal?>> run(void params) {
    return repository.getAddress();
  }
}
