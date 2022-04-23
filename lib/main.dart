import 'package:catalog_app/Pages/cart_page.dart';
import 'package:catalog_app/Pages/login_page.dart';
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'widgets/Themes.dart';
import 'package:flutter/material.dart';
import 'Pages/home_page.dart';
void main() {
  runApp(VxState( store: MyStore(), child:  const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,

      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute:(context) => const Homepage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) =>  CartPage(),
        
      },
    );
      
    
  }
 }