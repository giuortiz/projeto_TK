import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tokio_marine/containers/login/components/tela-login.dart';

import 'containers/inicio/components/tela-inicial.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCB5iYh2oEC4aiKS3uN9o4wrPmukzDXNOY",
          projectId: "tokio-marine-f2a9a",
          messagingSenderId: "605133314320",
          appId: "1:605133314320:web:ee7f13183dcadf2b27ed95"));
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
      home: const TelaLogin(),
    );
  }
}
