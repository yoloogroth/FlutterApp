import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loggin.dart';
import 'services/auth_service.dart';
import 'Home.dart';
import 'registro.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => Home(),
        '/signIn': (context) => RegistroPage(),
      },
    );
  }
}
