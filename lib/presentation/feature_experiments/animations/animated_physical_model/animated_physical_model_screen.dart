import 'package:flutter/material.dart';

import '../../../../uikit/theme/app_colors.dart';
import '../../../../uikit/widgets/app_bar/custom_app_bar.dart';

class AnimatedPhysicalModelScreen extends StatelessWidget {
  const AnimatedPhysicalModelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
          titleText: 'Animated Physical Model',
          textColor: AppColors.greenExperimentsDark,
          backgroundColor: AppColors.greenExperimentsLight),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MyAnimatedPhysicalModelWidget(),
            ],
          )),
    );
  }
}


class MyAnimatedPhysicalModelWidget extends StatefulWidget {
  const MyAnimatedPhysicalModelWidget({Key? key}) : super(key: key);
  @override
  _MyAnimatedPhysicalModelWidgetState createState() => _MyAnimatedPhysicalModelWidgetState();
}
class _MyAnimatedPhysicalModelWidgetState extends State<MyAnimatedPhysicalModelWidget> {
  bool _play = false;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [AnimatedPhysicalModel(
          duration: const Duration(seconds: 2),
          color: _play ? Colors.red : Colors.blue,
          elevation: _play ? 9 : 3,
          shape: BoxShape.rectangle,
          shadowColor: Colors.deepOrangeAccent,
          borderRadius: _play
              ? const BorderRadius.all(Radius.circular(0))
              : const BorderRadius.all(Radius.circular(24)),
          child: Container(
            width: 250,
            height: 150,
            child: const Center(
                child: Text(
                  'AnimatedPhysicalModel',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                )),
          ),
        ),
          const SizedBox(height: 50.0,),
          AnimatedPhysicalModel(
          duration: const Duration(seconds: 2),
          color: Colors.blue,
          elevation: _play ? 20 : 0,
          shape: BoxShape.rectangle,
          shadowColor: Colors.deepOrangeAccent,
          borderRadius: const BorderRadius.all(Radius.circular(0)),
          child: Container(
            width: 250,
            height: 150,
            child: const Center(
                child: Text(
                  'AnimatedPhysicalModel',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                )),
          ),
        ),

      const SizedBox(height: 50.0,),
      FloatingActionButton(
        onPressed: () {
          setState(() {
            _play = !_play;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    ],
    );
  }
}