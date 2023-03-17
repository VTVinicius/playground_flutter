import 'package:flutter/material.dart';
import 'package:playground_flutter/presentation/options_screen.dart';

class SegundaTela extends StatelessWidget {
  const SegundaTela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segunda Tela')),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bem vindo a segunda tela do seu app',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const OptionsScreen())));
                },
                child: const Text("Tela de Opções"),
              ),
            ],
          )),
    );
  }
}
