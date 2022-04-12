import 'package:catalog_app/Pages/home_page.dart';
import 'package:catalog_app/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'Pages/home_page.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.dark),

      routes: {
        "/": (context) => Homepage(),
        "/login":(context) => LoginPage(),
      },
    );
      
    
  }
}
