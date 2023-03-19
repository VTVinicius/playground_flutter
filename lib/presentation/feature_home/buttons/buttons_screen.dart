import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela de Botões')),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  primary: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 2),
                ),
                child: const Text("Outlined Button"),
              ),
              // espaçamento entre os botões
              const SizedBox(height: 16),

              CupertinoButton(
                  onPressed: () {},
                  child: const Text("Cupertino Button"),
                  color: Colors.green),
              const SizedBox(height: 16),

              ElevatedButton(
                  onPressed: () {}, child: const Text("Elevated Button")),
            ],
          )),
    );
  }
}

