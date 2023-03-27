import 'package:flutter/material.dart';
import 'package:playground_flutter/presentation/feature_home/widgets/home_buttons_list.dart';
import 'package:playground_flutter/presentation/feature_home/widgets/home_top_bar.dart';
import 'package:playground_flutter/presentation/feature_home/widgets/projects_list.dart';

import 'data/data_local/database/database_helper.dart';
import 'di/setup_get_it.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  
 final dbHelper = getIt<DatabaseHelper>();
  await dbHelper.init();

  runApp(
    const MyApp(),
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
    return WillPopScope(
      onWillPop: () async {
        // Desabilitar o botão de voltar para não fechar o aplicativo
        return false; // Retorne 'false' para impedir que o aplicativo seja fechado
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TopBarHome(),
              const SizedBox(height: 42),
              Row(children: const [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text("Projetos",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              ]),
              const SizedBox(height: 16),
              const ProjectsList(),
              const SizedBox(height: 32),
              Row(children: const [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text("Aplicações",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              ]),
              const SizedBox(height: 16),
              const HomeButtonsList(),
              const SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }
}
