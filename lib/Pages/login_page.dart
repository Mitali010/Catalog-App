import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
      // when we want to change in current screen
  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {       //underscore means private access
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>(); 
       // want to access some properties in form first give key to it , then add a textformfield with validation,create button
  moveToHome(BuildContext context) async {
    if(_formkey.currentState!. validate()) {
      
      setState(() {
        changeButton = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    
      setState(() {
        changeButton = false;
      });
    }                    

  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "lib/images/login_image.png",
                fit: BoxFit.cover,
                
                
                ),
                const SizedBox (height: 20.0),
                Text("Welcome $name",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
              
                )),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value){      // onchanged give callback whenever any change is occur
                          name = value;
                          setState(() {});        // it call build method and rebuild the current screen
                        },
                      ),
                    
                      TextFormField(
                        obscureText: true,
                         decoration: const InputDecoration(
                           hintText: "Enter Password",
                           labelText: "Password",
                          ) ,
                          validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty" ;
                          } else if(value.length <6) {
                            return "Password length should be atleast 6";
                          }
                          return null;
                        }
                        ),
                      const SizedBox(height: 40.0),
                      Material(
                        // ignore: deprecated_member_use
                        color: context.theme.buttonColor,      
                        borderRadius:
                            BorderRadius.circular(changeButton? 50:8),
                        child: InkWell(        //inkwell gives navigate property from one screen to another
                          splashColor: Colors.red,
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(    
                            duration: const Duration(seconds: 1),
                            width: changeButton ? 50: 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                            ? const Icon(
                              Icons.done,
                              color: Colors.white,
                              )
                              : const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                      
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
      ),
      
      
    );
  }
}