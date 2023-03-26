import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:playground_flutter/core/base_response.dart';
import 'package:provider/provider.dart';

import '../../../../core/error_widget.dart';
import '../../../../uikit/theme/app_colors.dart';
import '../../../../uikit/widgets/app_bar/custom_app_bar.dart';
import 'history_viewmodel.dart';

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
      create: (_) => GetIt.instance.get<HistoryViewModel>(),
      child: Consumer<HistoryViewModel>(
        builder: (_, viewModel, __) {
          return Stack(
            children: [
              Scaffold(
                backgroundColor: AppColors.background,
                appBar: CustomAppBar(
                  backgroundColor: AppColors.greenFeatures,
                  textColor: AppColors.greenFeaturesDark,
                  titleText: "Histórico de Pesquisa",
                ),
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
