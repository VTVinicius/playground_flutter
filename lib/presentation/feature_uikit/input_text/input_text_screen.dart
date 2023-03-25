import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextScreen extends StatelessWidget {
  const InputTextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tela de Botões')),
        body: Container(
            alignment: Alignment.topCenter,
            child:
                Container(margin: const EdgeInsets.all(24), child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              CupertinoSearchTextField(
                onChanged: (value) {
                  print(value);
                },
              ),
              const SizedBox(height: 16),
              CupertinoTextField(
                placeholder: "Cupertino Text Field",
                onChanged: (value) {
                  print(value);
                },
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Text Field'),
              ),
              const SizedBox(height: 16),


                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Pesquisar',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    maxLength: 8,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                    ],
                    onSubmitted: (value) {
                      print(value);
                    },
                  ),
            ]))));
  }
}
