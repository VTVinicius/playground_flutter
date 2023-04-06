import 'package:flutter/material.dart';
import 'package:playground_flutter/presentation/feature_canvas/weigth_picker/weight_picker.dart';

import '../../../uikit/theme/app_colors.dart';
import '../../../uikit/widgets/app_bar/custom_app_bar.dart';

class WeightPickerScreen extends StatefulWidget {
  const WeightPickerScreen({Key? key}) : super(key: key);

  @override
  State<WeightPickerScreen> createState() => _MyWeightPickerScreen();
}

class _MyWeightPickerScreen extends State<WeightPickerScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Weight Picker')),
        body: Center(
          child: SizedBox(
            height: 800,
            width: 400,
            child: WeightPicker(
              onWeightChange: (weight) {
                print('Weight changed: $weight');
              },
            ),
          ),
        ),
      ),
    );
  }
}
