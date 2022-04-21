import 'package:catalog_app/widgets/Themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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