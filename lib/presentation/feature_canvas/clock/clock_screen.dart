import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:playground_flutter/presentation/feature_canvas/clock/clock_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../uikit/theme/app_colors.dart';
import '../../../uikit/widgets/app_bar/custom_app_bar.dart';
import 'clock_component.dart';
import 'clock_state.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  State<ClockScreen> createState() => _MyClockScreen();
}

class _MyClockScreen extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GetIt.instance.get<ClockViewModel>(),
      child: Builder(
        builder: (BuildContext context) {
          ClockViewModel viewModel = Provider.of<ClockViewModel>(context, listen: false);
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ValueListenableBuilder<ClockState>(
                      valueListenable: viewModel.state,
                      builder: (context, clockState, _){
                          viewModel.runClock();
                        return Center(
                          child:
                          ClockExercise(
                            seconds: clockState.seconds,
                            minutes: clockState.minutes,
                            hours: clockState.hours,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}