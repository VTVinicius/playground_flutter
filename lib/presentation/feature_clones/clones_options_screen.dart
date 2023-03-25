
import 'package:flutter/material.dart';

import '../../uikit/theme/app_colors.dart';
import '../../uikit/widgets/app_bar/custom_app_bar.dart';
import '../../uikit/widgets/buttons/options_custom_button.dart';

class ClonesOptionsScreen extends StatelessWidget {
  const ClonesOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: 'Clones',
          textColor: AppColors.redClonesDark,
          backgroundColor: AppColors.redClonesLight
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionsCustomButton(
                  onPressed: () {},
                  text: "Em Breve",
                  buttonColor: AppColors.redClonesLight,
                  textColor: AppColors.redClonesDark,
                ),
                OptionsCustomButton(
                  onPressed: () {},
                  text: "Em Breve",
                  buttonColor: AppColors.redClonesLight,
                  textColor: AppColors.redClonesDark,
                ),
                OptionsCustomButton(
                  onPressed: () {},
                  text: "Em Breve",
                  buttonColor: AppColors.redClonesLight,
                  textColor: AppColors.redClonesDark,
                ),
              ],
            )),
      ),
    );
  }
}
