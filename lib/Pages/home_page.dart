import 'dart:html';

import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/Themes.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
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
      //appBar: AppBar(
        //title: const Text("Catalog App"),
        
      //),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,         // text in starting
            children:  [
              const CatalogHeader() ,
              if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)  
                CatalogList().expand()
              else 
              const Center(child: CircularProgressIndicator(),)    
            ],
          ),
        ),
      ));
  }
}

 
        
      class CatalogHeader extends StatelessWidget {
      const CatalogHeader({ Key? key }) : super(key: key);
    
      @override
      Widget build(BuildContext context) {
        return Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Catalog App".text.xl5.bold.color(MyTheme.darkbluishColor).make(),          //Text("Catalog App"), both are same
               "Trending Products".text.xl2.make(),      //xl2 is size
            ],
        );
      }
      }
      class CatalogList extends StatelessWidget {
        const CatalogList({ Key? key }) : super(key: key);
      
        @override
        Widget build(BuildContext context) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return CatalogItem(catalog:catalog);
            }
          );
        }
      }
      class CatalogItem extends StatelessWidget {
        final Item catalog;
        const CatalogItem({Key? key, required this.catalog }) : assert(catalog!= null),super(key: key);
      
        @override
        Widget build(BuildContext context) {
          return VxBox(
            child: Row(
              children: [
                CatalogImage(image:catalog.image,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [catalog.name.text.lg.color(MyTheme.darkbluishColor).bold.make(),    //lg is size
                    catalog.desc.text.coolGray500.make(),
                    10.heightBox,         // sizedbox
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: Vx.mOnly(right: 30),                 //monly means choose padding right or left
                      children: [
                        "\$${catalog.price}".text.bold.xl.make(),
                        ElevatedButton(onPressed: (){}, 
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.darkbluishColor)),
                        child: "Buy".text.make()
                        ),
                      ],
                    ) //.pOnly(right:8.0)
                    ],
                  ),
                )
              ]
            )
          ).white.roundedSM.square(150).make().py16();
                   // py is padding vertically between cards    // rounded sm means round card in small size
          
        }
      }
      
      class CatalogImage extends StatelessWidget {
        final String image;
        const CatalogImage({ Key? key, required this.image }) :assert(image != null), super(key: key);
      
        @override
        Widget build(BuildContext context){

          return Image.network(
            image,
              ).box.p8.roundedSM.color(MyTheme.creamColor).make().p16().w32(context);    
                    // box make means put image in box         // w is width
        }
      }
    
    

      // body: Padding(
      //   padding: const EdgeInsets.all(18.0),
      //   child: (CatalogModel.items!= null && CatalogModel.items.isNotEmpty)
      //   // gridview is a row having multiple items
      //   ? GridView.builder(
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,        // items in row
      //       mainAxisSpacing: 16,      // vertical spacing between 2 cards
      //       crossAxisSpacing: 16,
      //       ),      //griddelegate tell how many items are in single row
      //     itemBuilder: (context, index) {
      //       final item = CatalogModel.items[index];
      //        return Card (
      //          clipBehavior: Clip.antiAlias,
      //          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //          child: GridTile(
      //            header: Container(child: Text(item.name,
      //            style:  TextStyle(color: Colors.white),
      //            ),
      //            padding: const EdgeInsets.all(12),
      //            decoration: const BoxDecoration(
      //            color: Colors.blue,
      //            )),
      //            child: Image.network(item.image),
      //            footer: Container(child: Text(item.price.toString(),
      //            style:  TextStyle(color: Colors.white),
      //            ),
      //            padding: const EdgeInsets.all(12),
      //            decoration: const BoxDecoration(
      //            color: Colors.black,
      //            )),
                 
      //            ));
      //     },
      //     itemCount: CatalogModel.items.length,
      //     )   
      //   //ListView.builder(              // listbuilder is used to render the element in screen one by one in scrollable view 
      //     //itemCount: CatalogModel.items.length,
      //     //itemBuilder: (context, index) =>
      //        //ItemWidget(item: CatalogModel.items[index]) 
      //  // ) 
      //   :const Center(
      //     child: CircularProgressIndicator(),
      //   ),
      // ),
      // drawer: const MyDrawer(),
      //);
      //}
      //}