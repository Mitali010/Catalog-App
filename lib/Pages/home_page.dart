import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item_widgets.dart';
import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {
  final int days = 30;                                // elements are mutable widgets are immutable
  

  @override
  Widget build(BuildContext context) {          // context is stateless element 
    final dummylist = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
        
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.builder(              // listbuilder is used to render the element in screen one by one in scrollable view 
          itemCount: dummylist.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: dummylist[index]) ;
            
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
    
    
  }
}