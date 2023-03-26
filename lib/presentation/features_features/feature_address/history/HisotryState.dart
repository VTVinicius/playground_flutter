import 'package:playground_flutter/data/data_local/model/address_local.dart';

import '../../../../core/base_response.dart';

class HistoryState {
  BaseResponse<List<AddressLocal?>> endereco;

  HistoryState({
    required this.endereco,
  });

  HistoryState copyWith({
    BaseResponse<List<AddressLocal?>> ? endereco,
    bool? saveAddress,
  }) {
    return HistoryState(
      endereco: endereco ?? this.endereco,
    );
  }
}
