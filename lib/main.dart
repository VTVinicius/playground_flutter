import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_flutter/data/datasource/ViaCepDataSource.dart';
import 'package:playground_flutter/data/repository/address_repository.dart';
import 'package:playground_flutter/data/repository/address_repository_impl.dart';
import 'package:playground_flutter/presentation/feature_home/widgets/home_buttons_list.dart';
import 'package:playground_flutter/uikit/theme/app_colors.dart';

import 'core/network.dart';

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
          create: (context) =>
              AddressRepositoryImpl(
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
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [TopBarHome(), HomeButtonsList()],
        ),
      ),
    );
  }
}

class TopBarHome extends StatelessWidget {
  const TopBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 8,
      shape:  const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Container(
      height: 216,
      width: double.infinity,
      color: AppColors.greenApp,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          "assets/images/img_vini.png",
          height: 90,
          width: 90,
        ),
      ]),
    ),);
  }
}
