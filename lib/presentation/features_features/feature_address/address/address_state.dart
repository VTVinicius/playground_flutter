
import 'package:playground_flutter/core/base_response.dart';
import 'package:playground_flutter/data/data_remote/model/AddressResponse.dart';

class CepState {
  BaseResponse<AddressResponse?> endereco;
  BaseResponse<bool?> saveAddress;

  CepState({
    required this.endereco,
    required this.saveAddress,
  });

  CepState copyWith({
    BaseResponse<AddressResponse>? endereco,
    BaseResponse<bool?> ? saveAddress,
  }) {
    return CepState(
      endereco: endereco ?? this.endereco,
      saveAddress: saveAddress ?? this.saveAddress,
    );
  }
}