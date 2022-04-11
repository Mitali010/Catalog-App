import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {
  final int days = 30;
  const Homepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      
      body: Center(
        child: Container(
          child: Text("welcome 30 days of flutter"),
        ),
      ),
      drawer: Drawer(),
    );
    
    
  }
}