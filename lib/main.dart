
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playground_flutter/presentation/feature_home/widgets/home_buttons_list.dart';
import 'package:playground_flutter/presentation/feature_home/widgets/home_top_bar.dart';
import 'package:playground_flutter/presentation/feature_home/widgets/projects_list.dart';
import 'data/data_local/database/database_helper.dart';
import 'di/setup_get_it.dart';

Future<void> initDatabase() async {
  final dbHelper = DatabaseHelper();
  await dbHelper.init();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initDatabase();
  setupGetIt();

  runApp(
    await const MyApp(),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBarHome(),
              SizedBox(height: 42),
              Row(children: const [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text("Projetos",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              ]),
              SizedBox(height: 16),
              ProjectsList(),
              SizedBox(height: 32),
              Row(children: const [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text("Aplicações",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              ]),
              SizedBox(height: 16),
              HomeButtonsList(),
              SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }
}
