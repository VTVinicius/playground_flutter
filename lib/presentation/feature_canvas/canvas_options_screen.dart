import 'package:flutter/material.dart';
import 'package:playground_flutter/presentation/feature_canvas/clock/clock_screen.dart';
import 'package:playground_flutter/presentation/feature_canvas/weigth_picker/weight_picker_screen.dart';

import '../../uikit/theme/app_colors.dart';
import '../../uikit/widgets/app_bar/custom_app_bar.dart';
import '../../uikit/widgets/buttons/options_custom_button.dart';

class CanvasOptionsScreen extends StatelessWidget {
  const CanvasOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
          titleText: 'Canvas',
          textColor: AppColors.blueCanvasDark,
          backgroundColor: AppColors.blueCanvasLight),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionsCustomButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ClockScreen())));
              },
              text: "Clock Screen",
              buttonColor: AppColors.blueCanvasLight,
              textColor: AppColors.blueCanvasDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const WeightPickerScreen())));
              },
              text: "Weight Picker",
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
