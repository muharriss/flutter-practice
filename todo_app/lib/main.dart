import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

void main() async {
  // Memastikan binding widget sudah diinisialisasi sebelum mengakses platform-specific code
  WidgetsFlutterBinding.ensureInitialized();
  
  // Mendapatkan direktori aplikasi untuk menyimpan data lokal
  final dir = await getApplicationDocumentsDirectory();
  
  // Mengatur path default Hive untuk menyimpan database
  Hive.defaultDirectory = dir.path;

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}