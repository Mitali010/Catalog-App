import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{

  //static final cartModel = CartModel.internal();     // singleton class
  //CartModel.internal();
  //factory CartModel() => cartModel;
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
   //void add(Item item) {
     //_itemIds.add(item.id);
   //}
   // remove item
    //void remove(Item item) {
      //itemIds.remove(item.id);
    //}

}
class  AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
    
  }

}
class  RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
    
  }

}