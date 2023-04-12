import 'package:flutter/material.dart';

import '../../../../uikit/theme/app_colors.dart';
import '../../../../uikit/widgets/app_bar/custom_app_bar.dart';

class AnimatedDefaultTextStyleScreen extends StatelessWidget {
  const AnimatedDefaultTextStyleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
          titleText: 'Animated Default Text Style',
          textColor: AppColors.greenExperimentsDark,
          backgroundColor: AppColors.greenExperimentsLight),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [MyHomePage()],
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _first = true;
  double _fontSize = 40;
  Color _color = Colors.cyan;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 210,
              child: AnimatedDefaultTextStyle(
                curve: Curves.linear,
                duration: const Duration(milliseconds: 400),
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _color,
                  fontWeight: FontWeight.bold,
                ),
                child: Column(
                  children: const [
                    Text("Flutter Dev's"),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: () {
                  setState(() {
                    _fontSize = _first ? 60 : 30;
                    _color = _first ? Colors.blue : Colors.black;
                    _first = !_first;
                  });
                },
                child: const Text(
                  "Click Here!!",
                ),
              ),
            )
          ],
        ),
    );
  }
}
