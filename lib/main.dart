
import 'package:catalog_app/Pages/cart_page.dart';
import 'package:catalog_app/Pages/login_page.dart';
import 'package:catalog_app/utils/routes.dart';
import 'widgets/Themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/home_page.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,

      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute:(context) => Homepage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        
      },
    );
      
    
  }
 }