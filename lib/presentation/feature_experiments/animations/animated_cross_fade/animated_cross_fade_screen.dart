import 'package:flutter/material.dart';
import 'package:playground_flutter/uikit/widgets/buttons/options_custom_button.dart';

import '../../../../uikit/theme/app_colors.dart';
import '../../../../uikit/widgets/app_bar/custom_app_bar.dart';
import '../../../../uikit/widgets/buttons/features_button.dart';

class AnimatedCrossFadeScreen extends StatelessWidget {
  const AnimatedCrossFadeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool selected = true;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
          titleText: 'Animated Cross Fade',
          textColor: AppColors.greenExperimentsDark,
          backgroundColor: AppColors.greenExperimentsLight),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [MyAnimatedCrossFadeWidget()],
          )),
    );
  }
}

class MyAnimatedCrossFadeWidget extends StatefulWidget {
  const MyAnimatedCrossFadeWidget({super.key});

  @override
  State<MyAnimatedCrossFadeWidget> createState() =>
      _MyAnimatedCrossFadeWidgetState();
}

class _MyAnimatedCrossFadeWidgetState extends State<MyAnimatedCrossFadeWidget> {
  bool selected = true;
  bool selected2 = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedCrossFade(
          duration: const Duration(seconds: 2),
          firstChild: OptionsCustomButton(
            text: 'Animated Cross Fade',
            onPressed: () {
              setState(
                () {
                  selected = !selected;
                },
              );
            },
          ),
          secondChild: FeaturesButton(
            text: 'Animated Cross Fade',
            onPressed: () {
              setState(
                () {
                  selected = !selected;
                },
              );
            },
            image: const AssetImage('assets/images/img_canvas.png'),
          ),
          crossFadeState:
              selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),

        const SizedBox(height: 70,),
        AnimatedCrossFade(
          duration: const Duration(seconds: 2),
          firstChild: GestureDetector(
            onTap: () {
              setState(
                    () {
                  selected2 = !selected2;
                },
              );
            },
            child: Container(
              width: 150,
              height: 150,
              color: Colors.blue,
            ),
          ),
          secondChild: GestureDetector(
            onTap: () {
              setState(
                () {
                  selected2 = !selected2;
                },
              );
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
          crossFadeState:
              selected2 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        )
      ],
    );
  }
}
