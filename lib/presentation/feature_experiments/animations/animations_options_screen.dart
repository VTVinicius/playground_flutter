import 'package:flutter/material.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/animated_builder/animated_builder_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/animated_container/animated_container_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/animated_cross_fade/animated_cross_fade_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/animated_default_text_style/animated_defalut_text_style_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/animated_list/animated_list_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/animated_opacity/animated_opacity_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/animated_physical_model/animated_physical_model_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/animated_positioned/animated_positioned_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/animated_size/animated_size_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/animated_widget/animated_widget_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/decorated_box_transition/decorated_box_transition_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/hero/hero_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/positioned_transition/positioned_transition_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/rotation_transition/rotation_transition_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/scale_transition/scale_transition_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/size_transition/size_transition_screen.dart';
import 'package:playground_flutter/presentation/feature_experiments/animations/slide_transition/slide_transition_screen.dart';

import '../../../uikit/theme/app_colors.dart';
import '../../../uikit/widgets/app_bar/custom_app_bar.dart';
import '../../../uikit/widgets/buttons/options_custom_button.dart';
import 'animated_align/animated_align_screen.dart';
import 'fade_transition/fade_transition_screen.dart';

class AnimationsOptionsScreen extends StatelessWidget {
  const AnimationsOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
          titleText: 'Animações',
          textColor: AppColors.greenExperimentsDark,
          backgroundColor: AppColors.greenExperimentsLight),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const AnimatedAlignScreen())));
              },
              text: "Animated Align",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const AnimatedBuilderScreen())));
              },
              text: "Animated Builder",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const AnimatedContainerScreen())));
              },
              text: "Animated Container",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const AnimatedCrossFadeScreen())));
              },
              text: "Animated Cross Fade",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const AnimatedDefaultTextStyleScreen())));
              },
              text: "Animated Default Text Style",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const AnimatedListScreen())));
              },
              text: "Animated List",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const AnimatedOpacityScreen())));
              },
              text: "Animated Opacity",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const AnimatedPhysicalModelScreen())));
              },
              text: "Animated Physical Model",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const AnimatedPositionedScreen())));
              },
              text: "Animated Positioned",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const AnimatedSizeScreen())));
              },
              text: "Animated Size",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const AnimatedWidgetScreen())));
              },
              text: "Animated Widget",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const DecoratedBoxTransitionScreen())));
              },
              text: "Decorated Box Transition",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const FadeTransitionScreen())));
              },
              text: "Fade Transition",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const HeroScreen())));
              },
              text: "Hero",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const PositionedTransitionScreen())));
              },
              text: "Positioned Transition",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const RotationTransitionScreen())));
              },
              text: "Rotation Transition",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ScaleTransitionScreen())));
              },
              text: "Scale Transition",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SizeTransitionScreen())));
              },
              text: "ASize Transition",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            OptionsCustomButton(
              onPressed: () {
                onPressed:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SlideTransitionScreen())));
              },
              text: "Slide Transition",
              buttonColor: AppColors.greenExperimentsLight,
              textColor: AppColors.greenExperimentsDark,
            ),
            const SizedBox(height: 24),
          ],
        )),
      ),
    );
  }
}
