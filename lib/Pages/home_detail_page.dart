import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/Themes.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key ?key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    MyTheme.darkbluishColor,
                  ),
                  //shape: MaterialStateProperty.all(
                    //const StadiumBorder(),
                  //)
                  ),
              child: "Add to cart".text.make(),
            ).wh(120, 50)
          ],
        ).p32(),   
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context), //h is height
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,            
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(MyTheme.darkbluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.color(Colors.grey).make(),
                    10.heightBox,        //heightbox is sizedbox
                   "Amet sit no gubergren est eirmod gubergren justo dolor amet ipsum. Justo sea sed amet takimata et voluptua accusam,  lorem clita amet gubergren aliquyam diam, no amet et et et, amet duo takimata lorem eos dolor dolor sea. No magna no sed erat ipsum, no ut lorem diam aliquyam kasd vero amet stet, voluptua no dolor gubergren et amet sed.."
                   .text
                   .color(Colors.grey)
                   .make()
                   .p16()
                    
                  ],
                   ).py64(),
                  ),
                  
                ))   //padding b/w arc and name
                  ],
              ),
            ),
            );
          
        
      
  }
}


