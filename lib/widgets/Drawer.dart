import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Imageurl = "https://media-exp1.licdn.com/dms/image/C4E03AQHJIcf5rM4rkA/profile-displayphoto-shrink_200_200/0/1631518611667?e=1655942400&v=beta&t=r94TBPjece9gU0pdeuc5EnLEj2_OtOGaqLik3D6ON9c";
    return Drawer( 
      child: Container(
        color: Colors.blue,
        child: ListView(        //it display of widgets one after another in scroll view in drawer
          padding: EdgeInsets.zero,  
          children:  [
            DrawerHeader(
              padding: EdgeInsets.zero ,     // remove the space from right and left in header 
              child: UserAccountsDrawerHeader(
                margin:  EdgeInsets.zero,
                accountName: const Text("Mitali"),
                accountEmail:  const Text("mitalij194@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(Imageurl),
                  ),
              ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text("Home",
            textScaleFactor: 1.2,
            style: TextStyle(color: Colors.white),),

          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text("Profile",
            textScaleFactor: 1.2,
            style: TextStyle(color: Colors.white),),

          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text("Email me",
            textScaleFactor: 1.2,
            style: TextStyle(color: Colors.white),),

          )
          ],
        
        ),
      ),
    );
  }
}