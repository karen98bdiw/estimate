import 'package:estimators_app/pages/info_registring_screens.dart';
import 'package:estimators_app/pages/introScreen.dart';
import 'package:estimators_app/pages/loginActionCheckScreen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Colibri'),
      home: LoginActionCheckScreen(),
    );
  }
}

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

Future<void> main(List<String> args) async {
  await run();
}
