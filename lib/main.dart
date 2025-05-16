import 'package:flutter/material.dart';
import 'mahasiswa_home.dart';
import 'mahasiswa_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // <-- tambahkan ini

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Mahasiswa',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const MahasiswaHomePage(),
      },
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}


