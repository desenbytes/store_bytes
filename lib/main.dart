import 'package:flutter/material.dart';
import 'package:store_bytes/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Bytes',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 125, 141)
      ),
      debugShowCheckedModeBanner: false,//Retirar o banner da tela
      home: HomeScreen(),
    );
  }
}
