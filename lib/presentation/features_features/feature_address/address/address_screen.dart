import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:playground_flutter/core/base_response.dart';
import 'package:playground_flutter/uikit/theme/app_colors.dart';
import 'package:playground_flutter/uikit/widgets/app_bar/custom_app_bar.dart';
import 'package:playground_flutter/uikit/widgets/buttons/options_custom_button.dart';
import 'package:provider/provider.dart';

import '../../../../core/error_widget.dart';
import '../history/history_sceen.dart';
import 'address_view_model.dart';

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
      create: (_) => GetIt.instance.get<AddressViewModel>(),
      child: Consumer<AddressViewModel>(
        builder: (_, viewModel, __) {
          return Stack(
            children: [
              Scaffold(
                backgroundColor: AppColors.background,
                appBar: CustomAppBar(
                  backgroundColor: AppColors.greenFeatures,
                  textColor: AppColors.greenFeaturesDark,
                  titleText: "Pesquisa de Endereço",
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
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
                          OptionsCustomButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const HistoryScreen())));
                            },
                            text: "Historico",
                            buttonColor: AppColors.greenFeatures,
                            textColor: AppColors.greenFeaturesDark,
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ],
                  ),
                ),
                //caso queira passar um Erro personalizado, chamar validadeStateError(viewModel.error.)
                //assim ele desconsiderará os erros genericos e pode chamar algum dialog personalizado.
              ),
              WidgetError(
                response: viewModel.state.value.endereco,
                error: "Não foi possível encontrar o endereço",
              ),
              WidgetError(
                response: viewModel.state.value.saveAddress,
                error: "Não foi possível Salvar o endereço",
              ),
            ],
          );
        },
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
            hintText: viewModel.state.value.endereco.asSuccessOrNull()?.cep ??
                'Não encontrado',
          ),
          readOnly: true,
        ),
        const SizedBox(height: 16),
        const Text("Estado"),
        const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: viewModel.state.value.endereco.asSuccessOrNull()?.uf ??
                'Não encontrado',
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
                viewModel.state.value.endereco.asSuccessOrNull()?.localidade ??
                    'Não encontrado',
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
                viewModel.state.value.endereco.asSuccessOrNull()?.bairro ??
                    'Não encontrado',
          ),
          readOnly: true,
        ),
        const SizedBox(height: 16),
        const Text("Rua"),
        const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText:
                viewModel.state.value.endereco.asSuccessOrNull()?.logradouro ??
                    'Não encontrado',
          ),
          readOnly: true,
        ),
        const SizedBox(height: 16),
        const Text("Último CEP pesquisado"),
        const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: viewModel.state.value.lastCep.asSuccessOrNull() ??
                'Nenhum CEP pesquisado Recentemente',
          ),
          readOnly: true,
        ),
        const SizedBox(height: 16),
      ],
    ),
  );
}
