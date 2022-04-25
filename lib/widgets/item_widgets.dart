import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';
class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
  : assert (item != null ),       // assert only use in debugging tym not in production time
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          //print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
        textScaleFactor: 1.6,
        style: const TextStyle(color: Colors.blue,
        fontWeight: FontWeight.bold,
        ),
        
        ),
        
        
      ),
    );
  }
}