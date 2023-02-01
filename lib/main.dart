import 'package:flutter/material.dart';
import 'package:projeto_tokio_marine/containers/login/components/tela-login.dart';

import 'containers/inicio/components/tela-inicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Tokio Marine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const TelaInicial(),
    );
  }
}
