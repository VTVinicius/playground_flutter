import 'package:flutter/material.dart';
import 'package:playground_flutter/core/base_response.dart';
import 'package:playground_flutter/data/data_local/datasource/address_local_repository.dart';
import 'package:playground_flutter/presentation/features_features/feture_address/history/history_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../../core/error_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _MyHistoryScreen();
}

class _MyHistoryScreen extends State<HistoryScreen> {
  var titulo = "Bem Vindo";
  var cep = "Pesquisar CEP";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HistoryViewModel(context.read<AddressLocalRepository>()),
      child: Consumer<HistoryViewModel>(
        builder: (_, viewModel, __) {
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(title: const Text('Tela de Endereço Teste')),
                body: SingleChildScrollView(
                  child: Column(
                    children: [],
                  ),
                ),
              ),
              if (viewModel.state.value.endereco.asSuccessOrNull() != null)
                for (var i = 0;
                    i <
                        viewModel.state.value.endereco
                            .asSuccessOrNull()!
                            .length;
                    i++)
                  Text(viewModel.state.value.endereco
                          .asSuccessOrNull()![i]
                          ?.cep ??
                      ""),
              WidgetError(
                response: viewModel.state.value.endereco,
                error: "Não foi possível encontrar o endereço",
              ),
            ],
          );
        },
      ),
    );
  }
}
