
import 'package:catalog_app/Pages/login_page.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/home_page.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.blue,
      fontFamily: GoogleFonts.lato().fontFamily
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,

      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute:(context) => Homepage(),
        MyRoutes.loginRoute: (context) => LoginPage()
        
      },
    );
      
    
  }
}
