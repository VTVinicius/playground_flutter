import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../uikit/theme/app_colors.dart';
import '../../feature_experiments/experiements_options_screen.dart';
import '../../features_features/features_options_screen.dart';
import 'features_button.dart';

class HomeButtonsList extends StatelessWidget {
  const HomeButtonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          FeaturesButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const FeaturesOptionsScreen())));
            },
            text: "Features",
            image: const AssetImage('assets/images/img_features.png'),
            buttonColor: AppColors.greenFeatures,
            textColor: AppColors.greenFeaturesDark,
          ),
          const SizedBox(
            height: 16,
          ),
          FeaturesButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Em Breve",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
              );
            },
            text: "Canvas",
            image: const AssetImage('assets/images/img_canvas.png'),
            buttonColor: AppColors.blueCanvasLight,
            textColor: AppColors.blueCanvasDark,
          ),
          const SizedBox(
            height: 16,
          ),
          FeaturesButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Em Breve",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
              );
            },
            text: "Jogos",
            image: const AssetImage('assets/images/img_jogos.png'),
            buttonColor: AppColors.yellowGamesLight,
            textColor: AppColors.yellowGamesDark,
          ),
          const SizedBox(
            height: 16,
          ),
          FeaturesButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Em Breve",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
              );
            },
            text: "Clones",
            image: const AssetImage('assets/images/img_clones.png'),
            buttonColor: AppColors.redClonesLight,
            textColor: AppColors.redClonesDark,
          ),
          const SizedBox(
            height: 16,
          ),
          FeaturesButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const ExperimentOptionsScreen())));
            },
            text: "Ui Kit",
            image: const AssetImage('assets/images/img_uikit.png'),
            buttonColor: AppColors.purpleUikitLight,
            textColor: AppColors.purpleUikitDark,
          ),
          const SizedBox(
            height: 16,
          ),
          FeaturesButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const ExperimentOptionsScreen())));
            },
            text: "Experimentos",
            image: const AssetImage('assets/images/img_experimentos.png'),
            buttonColor: AppColors.greenExperimentsLight,
            textColor: AppColors.greenExperimentsDark,
          ),
        ],
      ),
    );
  }
}
