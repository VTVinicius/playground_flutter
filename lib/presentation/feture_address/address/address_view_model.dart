import 'package:flutter/material.dart';

import '../../../data/AddressResponse.dart';
import '../../../data/repository/address_repository.dart';
import '../../../domain/usecase/get_address_usecase.dart';

class AddressViewModel extends ChangeNotifier {
  final GetAddressUseCase _getAddressUseCase;
  AddressResponse? _endereco;
  bool _isLoading = false;
  String _error = "";

  AddressViewModel(AddressRepository repository)
      : _getAddressUseCase = GetAddressUseCase(repository);

  AddressResponse? get endereco => _endereco;

  bool get isLoading => _isLoading;

  Future<void> buscarEndereco(String cep) async {
    _isLoading = true;
    _getAddressUseCase.invoke(
        params: GetAddressParam(cep),
        onError: (erro) {
          _error = erro.toString();
        },
        onSuccess: (resultado) {
          _endereco = resultado;
          notifyListeners();
        },
        onFinally: () {
          _isLoading = false;
        });
    notifyListeners();
  }

  void showAddress() {
    print('teste para ver o endereço $_endereco');
  }

  int _contador = 0;

  int get contador => _contador;

  void incrementarContador() {
    _contador++;
    notifyListeners();
  }
}
