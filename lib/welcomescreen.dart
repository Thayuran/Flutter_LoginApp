
import 'package:flutter/material.dart';
import 'package:login_app/RegistrationPage.dart';
import 'package:login_app/loginScreen.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:
            [
              Color.fromARGB(255, 16, 113, 204),
              Color.fromARGB(255, 16, 113, 204)
            ])
        ),
        child: Column(
          children: [
          const Padding(
            padding:EdgeInsets.only(top:200),
            child:Image(image:AssetImage('/assets/systems-logo.png')),
          ),
          const SizedBox(
            height: 100,
          ),
          const Text('Welcome Back',style: TextStyle(
            fontSize: 30,
            color: Colors.black
          ),),
          const SizedBox(
            height: 30,
          ),GestureDetector(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
              const Loginscreen()));
            },
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black),

              ),
              child: const Center(child: Text('sign in',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),),
            ),
          ),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>const RegistrationPage()));

            },
            child: Container(
              height: 55,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
            ),
          )
          ]
        ),
      ),
      
    );
  }
}