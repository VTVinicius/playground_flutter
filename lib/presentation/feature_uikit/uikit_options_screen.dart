import 'package:flutter/material.dart';
import 'package:playground_flutter/uikit/theme/app_colors.dart';

import '../../uikit/widgets/app_bar/custom_app_bar.dart';
import '../../uikit/widgets/buttons/MyCupertinoButton.dart';
import '../../uikit/widgets/buttons/options_custom_button.dart';
import 'buttons/buttons_screen.dart';
import 'input_text/input_text_screen.dart';

class UikitOptionsScreen extends StatelessWidget {
  const UikitOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: 'UiKit',
          textColor: AppColors.purpleUikitDark,
          backgroundColor: AppColors.purpleUikitLight
      ),
      body:  Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OptionsCustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const ButtonsScreen())));
                },
                text: "Buttons",
                buttonColor: AppColors.purpleUikitLight,
                textColor: AppColors.purpleUikitDark,
              ),

              OptionsCustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const InputTextScreen())));
                },
                text: "Input Text",
                buttonColor: AppColors.purpleUikitLight,
                textColor: AppColors.purpleUikitDark,
              ),
            ],
          )),
      ),
    );
  }
}
