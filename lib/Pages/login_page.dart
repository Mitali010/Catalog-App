import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {      // when we want to change in current screen
  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {       //underscore means private access
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "lib/images/login_image.png",
              fit: BoxFit.cover,
              height: 300,
              
              ),
              SizedBox(
                height: 20.0,
              ),
      
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
      
              ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      onChanged: (value){      // onchanged give callback whenever any change is occur
                        name = value;
                        setState(() {          // it call build method and rebuild the current screen
                          
                        });
                      },
                    ),
                  
                    TextFormField(
                      obscureText: true,
                       decoration: InputDecoration(
                         hintText: "Enter Password",
                         labelText: "Password",
                        ) ,
                               
                    ),
                    SizedBox(
                      height: 40.0,
                      
                    ),
                    InkWell(        //inkwell gives navigate property from one screen to another
                      onTap: () async {
                        setState(() {
                          changeButton = true;
                        });
                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                    
                      },
                      child: AnimatedContainer(    
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50: 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                        ? Icon(
                          Icons.done,
                          color: Colors.white,
                          )
                          : Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,      // give color either in decoration or in text
                            borderRadius:BorderRadius.circular(changeButton? 50:8),
                          ),

                        ),
                    )
                    //ElevatedButton(
                     // child: Text("Login"),
                      //style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      //onPressed: () {
                       // Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //},
                   // ),
                  ],
              ),
              ),
          ],
      
        ),
      ),
      
      
    );
  }
}