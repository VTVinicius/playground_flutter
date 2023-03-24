
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../uikit/widgets/MyCupertinoButton.dart';
import 'feture_address/address/address_screen.dart';

class FeaturesOptionsScreen extends StatelessWidget {
  const FeaturesOptionsScreen({Key? key}) : super(key: key);

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
                          builder: ((context) => const AddressScreen())));
                },
                text: "Address Screen",
              )
            ],
          )),
    );
  }
}

//button component
