import 'package:catalog_app/widgets/Themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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