import 'package:flutter/material.dart';
import 'package:playground_flutter/core/base_response.dart';
import 'package:playground_flutter/domain/usecase/address/get_all_addresses_usecase.dart';

import 'HisotryState.dart';

class HistoryViewModel extends ChangeNotifier {
  final GetAllAddressesUseCase _getAllAddressesUseCase;

  final ValueNotifier<HistoryState> _state =
      ValueNotifier<HistoryState>(HistoryState(endereco: Waiting()));

  ValueNotifier<HistoryState> get state => _state;

  HistoryViewModel(this._getAllAddressesUseCase) {
    buscarEndereco();
  }

  Future<void> buscarEndereco() async {
    _state.updateState((cepState) => cepState.copyWith(endereco: Loading()));
    _getAllAddressesUseCase.invoke(
      onSuccess: (resultado) {
        _state.updateState((historyState) =>
            historyState.copyWith(endereco: Success(value: resultado)));
        notifyListeners();
      },
      onError: (erro) {
        _state.updateState((historyState) =>
            historyState.copyWith(endereco: Error(error: erro)));
        notifyListeners();
      },
    );
    notifyListeners();
  }
}
