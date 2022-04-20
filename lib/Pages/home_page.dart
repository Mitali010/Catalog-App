import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;                                
  // elements are mutable widgets are immutable
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async{
    await Future.delayed(const Duration(seconds: 2));
    final CatalogJson =await rootBundle.loadString("lib/files/Catalog.json");
    final decodedData = jsonDecode(CatalogJson);
    var productsData =  decodedData["products"];
     CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
     setState(() {});
  }
  @override
  Widget build(BuildContext context) {          // context is stateless element 
    //final dummylist = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
        
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: (CatalogModel.items!= null && CatalogModel.items.isNotEmpty)? ListView.builder(              // listbuilder is used to render the element in screen one by one in scrollable view 
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) =>
             ItemWidget(item: CatalogModel.items[index]) 
        ) 
        :const Center(
          child: CircularProgressIndicator(),
        )
      ),
      drawer: const MyDrawer(),
    );
    
    
  }
}