import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playground_flutter/uikit/theme/app_colors.dart';

import '../../../uikit/widgets/app_bar/custom_app_bar.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
          titleText: 'Tela de Botões',
          textColor: AppColors.purpleUikitDark,
          backgroundColor: AppColors.purpleUikitLight),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  primary: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 2),
                ),
                child: const Text("Outlined Button"),
              ),
              // espaçamento entre os botões
              const SizedBox(height: 16),

              CupertinoButton(
                  onPressed: () {},
                  child: const Text("Cupertino Button"),
                  color: Colors.green),
              const SizedBox(height: 16),

              ElevatedButton(
                  onPressed: () {}, child: const Text("Elevated Button")),
            ],
          )),
    );
  }
}
