import 'dart:io';

import 'package:flutter/material.dart';
import 'package:playground_flutter/core/base_response.dart';

import '../../../../data/AddressResponse.dart';
import '../../../../data/repository/address_repository.dart';
import '../../../../domain/usecase/get_address_usecase.dart';
import 'address_state.dart';

class AddressViewModel extends ChangeNotifier {
  final GetAddressUseCase _getAddressUseCase;

  final ValueNotifier<CepState> _state =
      ValueNotifier<CepState>(CepState(endereco: Waiting(), saveAddress: null));

  ValueNotifier<CepState> get state => _state;

  bool _isLoading = false;
  Object? _error;

  AddressViewModel(AddressRepository repository)
      : _getAddressUseCase = GetAddressUseCase(repository);


  Future<void> buscarEndereco(String cep) async {
    _state.updateState((cepState) => cepState.copyWith(endereco: Loading()));
    _getAddressUseCase.invoke(
        params: GetAddressParam(cep),
        onSuccess: (resultado) {
          _state.updateState((cepState) => cepState.copyWith(
              endereco: Success(value: resultado as AddressResponse)));
          notifyListeners();
        },
        onError: (erro) {
          _state.updateState(
              (cepState) => cepState.copyWith(endereco: Error(error: erro)));
          _error = erro;
          notifyListeners();
        },
       );
    notifyListeners();
  }

  int _contador = 0;

  int get contador => _contador;

  void incrementarContador() {
    _contador++;
    notifyListeners();
  }
}
