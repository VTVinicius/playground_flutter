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
  var weight = 80;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.background,
          appBar: CustomAppBar(
            backgroundColor: AppColors.blueCanvasLight,
            textColor: AppColors.blueCanvasDark,
            titleText: "Relogio de Ponteiros",
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Center(child: Text("Peso: $weight", style: TextStyle(fontSize: 48),)),

              Spacer(),
              // Adiciona um Spacer para empurrar o WeightPicker para baixo
              // Ou você pode usar um SizedBox com altura específica:
              // SizedBox(height: 200),
              Expanded(
                child: WeightPicker(
                  onWeightChange: (newWeight) {
                    setState(() {
                      weight = newWeight;
                    });
                    print('Weight changed: $weight');
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
