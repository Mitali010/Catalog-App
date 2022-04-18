import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  

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
              "Welcome",
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
                    ElevatedButton(
                      child: Text("Login"),
                      style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                    ),
                  ],
              ),
              ),
          ],
      
        ),
      ),
      
      
    );
  }
}