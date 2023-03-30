import 'package:flutter/material.dart';
import 'package:playground_flutter/core/base_response.dart';
import 'package:playground_flutter/domain/usecase/address/get_last_cep_usecase.dart';
import 'package:playground_flutter/domain/usecase/address/save_address_usecase.dart';
import 'package:playground_flutter/domain/usecase/address/save_last_cep_usecase.dart';

import '../../../../data/data_remote/model/AddressResponse.dart';
import '../../../../domain/usecase/address/get_address_usecase.dart';
import 'address_state.dart';

class AddressViewModel extends ChangeNotifier {
  final GetAddressUseCase _getAddressUseCase;
  final SaveAddressUseCase _saveAddressUseCase;
  final GetLastCEPUseCase _getLastCEPUseCase;
  final SaveLastCEPUseCase _saveLastCEPUseCase;

  final ValueNotifier<CepState> _state = ValueNotifier<CepState>(
      CepState(
          endereco: Waiting(), saveAddress: Waiting(), lastCep: Waiting()));

  ValueNotifier<CepState> get state => _state;

  AddressViewModel(this._getAddressUseCase, this._saveAddressUseCase,
      this._getLastCEPUseCase, this._saveLastCEPUseCase) {
    getLastCEP();
  }

  Future<void> buscarEndereco(String cep) async {
    _state.updateState((cepState) => cepState.copyWith(endereco: Loading()));
    _getAddressUseCase.invoke(
      params: GetAddressParam(cep),
      onSuccess: (resultado) {
        _state.updateState((cepState) =>
            cepState.copyWith(
                endereco: Success(value: resultado as AddressResponse)));
        salvarEndereco(resultado as AddressResponse);
        notifyListeners();
      },
      onError: (erro) {
        _state.updateState(
                (cepState) => cepState.copyWith(endereco: Error(error: erro)));
        notifyListeners();
      },
    );
  }

  Future<void> salvarEndereco(AddressResponse address) async {
    _saveAddressUseCase.invoke(
      params: SaveAddressParam(address),
      onSuccess: (resultado) {
        _state.updateState(
                (cepState) =>
                cepState.copyWith(endereco: Success(value: address)));
        saveLastCep(address.cep);
        notifyListeners();
      },
      onError: (erro) {
        _state.updateState(
                (cepState) =>
                cepState.copyWith(saveAddress: Error(error: erro)));
        notifyListeners();
      },
    );
  }

  Future<void> saveLastCep(String cep) async {
    _saveLastCEPUseCase.invoke(
      params: SaveCEPParams(cep),
      onSuccess: (resultado) {
        getLastCEP();
        notifyListeners();
      },
      onError: (erro) {
        _state.updateState(
                (cepState) => cepState.copyWith(lastCep: Error(error: erro)));
        notifyListeners();
      },
    );
  }

  Future<void> getLastCEP() async {
    _getLastCEPUseCase.invoke(
      params: null,
      onSuccess: (resultado) {
        _state.updateState((cepState) =>
            cepState.copyWith(lastCep: Success(value: resultado)));
        notifyListeners();
      },
      onError: (erro) {
        _state.updateState(
                (cepState) => cepState.copyWith(lastCep: Error(error: erro)));
        notifyListeners();
      },
    );
  }
}
