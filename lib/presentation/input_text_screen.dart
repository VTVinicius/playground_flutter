import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextScreen extends StatelessWidget {
  const InputTextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tela de Botões')),
        body: Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center, children: [

                  CupertinoSearchTextField(
                    onChanged: (value) {
                      print(value);
                    },
                  ),

            ])));
  }
}
