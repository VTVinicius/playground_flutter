import 'package:flutter/material.dart';
import 'package:playground_flutter/uikit/theme/app_colors.dart';

import '../../uikit/widgets/app_bar/custom_app_bar.dart';
import '../../uikit/widgets/buttons/options_custom_button.dart';

class ExperimentOptionsScreen extends StatelessWidget {
  const ExperimentOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
          titleText: 'Experimentos',
          textColor: AppColors.greenExperimentsDark,
          backgroundColor: AppColors.greenExperimentsLight),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionsCustomButton(
              onPressed: () {},
              text: "Em Breve",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {},
              text: "Em Breve",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {},
              text: "Em Breve",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
          ],
        )),
      ),
    );
  }
}

//button component
