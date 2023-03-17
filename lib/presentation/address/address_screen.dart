import 'package:flutter/material.dart';
import 'package:playground_flutter/data/repository/address_repository_impl.dart';
import 'package:playground_flutter/presentation/address/address_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/repository/address_repository.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _MyAddressScreen();
}

class _MyAddressScreen extends State<AddressScreen> {
  var titulo = "Bem Vindo";
  var cep = "Pesquisar CEP";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AddressViewModel(context.read<AddressRepository>()),
        child: Scaffold(
          appBar: AppBar(title: const Text('Tela de Endereço Teste')),
          body: Container(
            alignment: Alignment.center,
            child: Consumer<AddressViewModel>(
              builder: (_, viewModel, __) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Cep é: $cep'),
                      ElevatedButton(
                        onPressed: () {
                          viewModel.buscarEndereco('88350001');
                          setState((){
                            cep = viewModel.endereco?.cep ?? '';
                          });
                        },
                        child: Text('Buscar'),
                      ),
                    ]);
              },
            ),
          ),
        ));
  }
}
