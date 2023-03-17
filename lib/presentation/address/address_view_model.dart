import 'package:flutter/material.dart';

import '../../data/AddressResponse.dart';
import '../../data/repository/address_repository.dart';
import '../../data/repository/address_repository_impl.dart';
import '../../domain/usecase/get_address_usecase.dart';

class AddressViewModel extends ChangeNotifier {


  final GetAddressUseCase _getAddressUseCase;
  AddressResponse? _endereco;

  AddressViewModel(AddressRepository repository)
      : _getAddressUseCase = GetAddressUseCase(repository);

  AddressResponse? get endereco => _endereco;

  Future<void> buscarEndereco(String cep) async {
    final params = GetAddressParam(cep);
    _endereco = await _getAddressUseCase(params);
    notifyListeners();
  }

  void showAddress(){
    print('teste para ver o endereço $_endereco');

  }

  int _contador = 0;

  int get contador => _contador;

  void incrementarContador() {
    _contador++;
    notifyListeners();
  }
}