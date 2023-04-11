import 'package:flutter/material.dart';
import 'package:playground_flutter/uikit/widgets/circular_image.dart';

import '../../../../uikit/theme/app_colors.dart';
import '../../../../uikit/widgets/app_bar/custom_app_bar.dart';

class AnimatedContainerScreen extends StatelessWidget {
  const AnimatedContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
          titleText: 'Animated Container',
          textColor: AppColors.greenExperimentsDark,
          backgroundColor: AppColors.greenExperimentsLight),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MyAnimatedContainerWidget(),
            ],
          )),
    );
  }
}

class MyAnimatedContainerWidget extends StatefulWidget {
  const MyAnimatedContainerWidget({super.key});

  @override
  State<MyAnimatedContainerWidget> createState() =>
      _MyAnimatedContainerWidgetState();
}

class _MyAnimatedContainerWidgetState extends State<MyAnimatedContainerWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
          child: AnimatedContainer(
            width: selected ? 400.0 : 200.0,
            height: selected ? 200.0 : 400.0,
            color: selected ? Colors.red : Colors.blue,
            alignment:
            selected ? Alignment.center : AlignmentDirectional.topCenter,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: Stack(children: [CircularImageWithBorder(
              imagePath: "assets/images/img_vini.png",
              imageSize: 100.0,
              borderWidth: 2.0,
              borderColor: Colors.white,
            ),
          ]
          )
      ),
    ),);
  }
}