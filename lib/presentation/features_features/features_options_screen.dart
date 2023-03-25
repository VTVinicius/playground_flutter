
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playground_flutter/uikit/theme/app_colors.dart';
import 'package:playground_flutter/uikit/widgets/buttons/options_custom_button.dart';

import '../../uikit/widgets/app_bar/custom_app_bar.dart';
import '../../uikit/widgets/buttons/MyCupertinoButton.dart';
import 'feture_address/address/address_screen.dart';

class FeaturesOptionsScreen extends StatelessWidget {
  const FeaturesOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleText: 'Features',
          textColor: AppColors.greenFeaturesDark,
          backgroundColor: AppColors.greenFeatures
      ),
      body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              OptionsCustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const AddressScreen())));
                },
                text: "Address Screen",
              ),
              OptionsCustomButton(
                onPressed: () {
                },
                text: "Em Breve",
              ),


            ],
          )),
      ),
    );
  }
}

//button component
