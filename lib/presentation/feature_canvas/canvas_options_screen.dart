
import 'package:flutter/material.dart';

import '../../uikit/theme/app_colors.dart';
import '../../uikit/widgets/app_bar/custom_app_bar.dart';
import '../../uikit/widgets/buttons/options_custom_button.dart';

class CanvasOptionsScreen extends StatelessWidget {
  const CanvasOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: 'Canvas',
          textColor: AppColors.blueCanvasDark,
          backgroundColor: AppColors.blueCanvasLight
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
                  buttonColor: AppColors.blueCanvasLight,
                  textColor: AppColors.blueCanvasDark,
                ),
                OptionsCustomButton(
                  onPressed: () {},
                  text: "Em Breve",
                  buttonColor: AppColors.blueCanvasLight,
                  textColor: AppColors.blueCanvasDark,
                ),
                OptionsCustomButton(
                  onPressed: () {},
                  text: "Em Breve",
                  buttonColor: AppColors.blueCanvasLight,
                  textColor: AppColors.blueCanvasDark,
                ),
              ],
            )),
      ),
    );
  }
}
