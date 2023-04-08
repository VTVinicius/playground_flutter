import 'package:flutter/material.dart';
import 'package:playground_flutter/uikit/theme/app_colors.dart';
import 'package:playground_flutter/uikit/widgets/buttons/features_button.dart';
import 'package:playground_flutter/uikit/widgets/buttons/options_custom_button.dart';

import '../../../uikit/widgets/app_bar/custom_app_bar.dart';

class ButtonsUiKit extends StatelessWidget {
  const ButtonsUiKit({Key? key}) : super(key: key);

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
              OptionsCustomButton(
                onPressed: () {},
                text: "Options Custom Button",
                buttonColor: AppColors.purpleUikitLight,
                textColor: AppColors.purpleUikitDark,
              ),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: FeaturesButton(
                    text: "Feature Button",
                    buttonColor: AppColors.purpleUikitLight,
                    textColor: AppColors.purpleUikitDark,
                    onPressed: () {},
                    image:
                        const AssetImage('assets/images/img_experimentos.png'),
                  )),
            ],
          )),
    );
  }
}
