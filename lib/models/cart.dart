import 'package:catalog_app/models/catalog.dart';

class CartModel{
  // catalog field
   late CatalogModel _catalog;
  // collections of ids - store ids of each items
  final List <int> _itemIds = [];
   // get catalog
   CatalogModel get catalog => _catalog;
   // set catalog
   set catalog(CatalogModel newCatalog){
     assert(newCatalog != null);
     _catalog = newCatalog;
   }
   // get items in list 
   List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

   //get total price
   num get totalPrice => items.fold(0,(total,current) => total + current.price);

   // add item
   void add(Item item) {
     _itemIds.add(item.id);
   }
   // remove item
    void remove(Item item) {
      _itemIds.remove(item.id);
    }

}