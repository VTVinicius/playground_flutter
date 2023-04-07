import 'package:flutter/material.dart';
import 'package:playground_flutter/uikit/theme/app_colors.dart';

import '../../uikit/widgets/app_bar/custom_app_bar.dart';
import '../../uikit/widgets/buttons/options_custom_button.dart';

class UikitOptionsScreen extends StatelessWidget {
  const UikitOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
          titleText: 'UiKit',
          textColor: AppColors.purpleUikitDark,
          backgroundColor: AppColors.purpleUikitLight),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionsCustomButton(
              onPressed: () {},
              text: "Em Breve",
              buttonColor: AppColors.purpleUikitLight,
              textColor: AppColors.purpleUikitDark,
            ),
          OptionsCustomButton(
              onPressed: () {},
              text: "Em Breve",
              buttonColor: AppColors.purpleUikitLight,
              textColor: AppColors.purpleUikitDark,
            ),
            OptionsCustomButton(
              onPressed: () {},
              text: "Em Breve",
              buttonColor: AppColors.purpleUikitLight,
              textColor: AppColors.purpleUikitDark,
            ),
          ],
        )),
      ),
    );
  }
}
