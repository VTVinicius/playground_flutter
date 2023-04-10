import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:playground_flutter/uikit/widgets/buttons/features_button.dart';

import '../../../../uikit/theme/app_colors.dart';
import '../../../../uikit/widgets/app_bar/custom_app_bar.dart';

class AnimatedBuilderScreen extends StatelessWidget {
  const AnimatedBuilderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
          titleText: 'Animated Builder',
          textColor: AppColors.greenExperimentsDark,
          backgroundColor: AppColors.greenExperimentsLight),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MyAnimatedBuilderWidget(),
            ],
          )),
    );
  }
}

class MyAnimatedBuilderWidget extends StatefulWidget {
  const MyAnimatedBuilderWidget({super.key});

  @override
  State<MyAnimatedBuilderWidget> createState() =>
      _MyAnimatedBuilderWidgetState();
}

class _MyAnimatedBuilderWidgetState extends State<MyAnimatedBuilderWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4), // Duração da animação atualizada
    vsync: this,
  )..forward(); // Alterado de repeat() para forward()

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: FeaturesButton(
        text: 'Animated Builder',
        onPressed: () {},
        image: const AssetImage('assets/images/img_canvas.png'),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 4.0 * math.pi, // Atualizado para 720 graus (2 ciclos de rotação)
          child: child,
        );
      },
    );
  }
}