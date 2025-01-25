import 'package:flutter/material.dart';
import 'package:hesaplama/hesaplama/Hesaplama_Ekran%C4%B1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF008EFF), // Ana renk
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
          bodyMedium: TextStyle(color: Colors.grey[800], fontSize: 25,fontWeight: FontWeight.bold,),
        ),
        useMaterial3: true,
      ),
      home: HesaplamaEkrani(),
    );
  }
}

