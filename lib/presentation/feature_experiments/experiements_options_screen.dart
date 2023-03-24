import 'package:flutter/material.dart';
import '../../uikit/widgets/MyCupertinoButton.dart';
import 'buttons/buttons_screen.dart';
import 'input_text/input_text_screen.dart';


class ExperimentOptionsScreen extends StatelessWidget {
  const ExperimentOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Opções de Teste')),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCupertinoButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const ButtonsScreen())));
                },
                text: "Buttons",
              ),
              const SizedBox(height: 24),
              MyCupertinoButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const InputTextScreen())));
                },
                text: "Input Text",
              ),
            ],
          )),
    );
  }
}

//button component
