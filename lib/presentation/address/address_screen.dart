import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              return Column(children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Pesquisar',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    maxLength: 8,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                    ],
                    onSubmitted: (value) {
                      viewModel.buscarEndereco(value);
                    },
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _TextFields(viewModel),
                    ]),
              ]);
            },
          ),
        ),
      ),
    );
  }
}

Widget _TextFields(AddressViewModel viewModel) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("CEP"),
        const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '${viewModel.endereco?.cep ?? 'Não encontrado'}',
          ),
          readOnly: true,
        ),
        const SizedBox(height: 16),
        const Text("Estado"),
        const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '${viewModel.endereco?.uf ?? 'Não encontrado'}',
          ),
          readOnly: true,
        ),
        const SizedBox(height: 16),
        const Text("Cidade"),
        const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText:
            '${viewModel.endereco?.localidade ?? 'Não encontrado'}',
          ),
          readOnly: true,
        ),
        const SizedBox(height: 16),
        const Text("Bairro"),
        const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText:
            '${viewModel.endereco?.bairro ?? 'Não encontrado'}',
          ),
          readOnly: true,
        ),
        const SizedBox(height: 16),
        const Text("Rua"),
        const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '${viewModel.endereco?.logradouro ?? 'Não encontrado'}',
          ),
          readOnly: true,
        ),
        const SizedBox(height: 16),
      ],
    ),
  );
}
