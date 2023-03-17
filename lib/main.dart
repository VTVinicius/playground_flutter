import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_flutter/data/datasource/ViaCepDataSource.dart';
import 'package:playground_flutter/data/repository/address_repository.dart';
import 'package:playground_flutter/data/repository/address_repository_impl.dart';
import 'package:playground_flutter/domain/usecase/get_address_usecase.dart';
import 'package:playground_flutter/presentation/segundatela.dart';

import 'core/network.dart';
import 'data/AddressResponse.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        ///
        /// Services
        ///
        RepositoryProvider<NetworkManager>(
          create: (context) => NetworkManager(),
        ),

        ///
        /// Data sources
        ///
        RepositoryProvider<ViaCepDataSource>(
          create: (context) => ViaCepDataSource(context.read<NetworkManager>()),
        ),
        RepositoryProvider<AddressRepository>(
          create: (context) => AddressRepositoryImpl(
              viaCepDataSource: context.read<ViaCepDataSource>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var titulo = "Bem Vindo";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela Inicial')),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text(
             "teste",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SegundaTela())));
                  // setState(() {
                  //   titulo = "teste";
                  // });
                },
                icon: const Icon(Icons.arrow_forward_sharp)),
            IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.arrow_forward_sharp))
          ],
        ),
      ),
    );
  }
}
