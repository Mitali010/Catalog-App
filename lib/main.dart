import 'package:catalog_app/Pages/cart_page.dart';
import 'package:catalog_app/Pages/login_page.dart';
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'widgets/Themes.dart';
import 'package:flutter/material.dart';
import 'Pages/home_page.dart';
import 'package:url_strategy/url_strategy.dart';
void main() {
  setPathUrlStrategy();
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
    
        //"/": (_, __) =>MaterialPage(child: LoginPage()),
        //MyRoutes.homeRoute: (_, __) => MaterialPage(child: Homepage()),
        //MyRoutes.homeRoute: (_, __) => MaterialPage(child: LoginPage()),
        //MyRoutes.homeRoute: (_, __) => MaterialPage(child: CartPage()),
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute:(context) => const Homepage(),
        MyRoutes.loginRoute: (context) =>const  LoginPage(),
        MyRoutes.cartRoute: (context) =>  const CartPage(),
        
      },
    );
      
    
  }
 }