import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {
  final int days = 30;
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
        
      ),
      
      body: Center(
        child: Container(
          child: const Text("welcome 30 days of flutter"),
        ),
      ),
      drawer: const MyDrawer(),
    );
    
    
  }
}