import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationPage extends StatelessWidget {
   RegistrationPage({Key? key}) : super(key: key);
  
final nameController=TextEditingController();
final emailController=TextEditingController();
final passwordController=TextEditingController();

 final CollectionReference  collRef = FirebaseFirestore.instance.collection('SamoleApp');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(//thanks for watching
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 16, 113, 204),
                  Color(0xff281537),
                ]),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Create Your\nAccount',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                height: double.infinity,
                width: double.infinity,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.check,color: Colors.grey,),
                            label: Text('Full Name',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Color.fromARGB(255, 16, 113, 204),
                            ),)
                        ),
                        
                      ),
                       TextField(
                        controller:emailController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.check,color: Colors.grey,),
                            label: Text('Phone or Gmail',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Color.fromARGB(255, 16, 113, 204),
                            ),)
                        ),
                      ),
                       TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                            label: Text('Password',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Color.fromARGB(255, 16, 113, 204),
                            ),)
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                            label: Text('Conform Password',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Color.fromARGB(255, 16, 113, 204),
                            ),)
                        ),
                      ),

                      const SizedBox(height: 10,),
                      const SizedBox(height: 70,),
                      
                      ElevatedButton(
                          onPressed: () async {
                            // Validate if fields are not empty
                            if (nameController.text.isNotEmpty &&
                                emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              try {
                                await collRef.add({
                                  'name': nameController.text,
                                  'email': emailController.text,
                                  'mobile': passwordController.text,
                                  'createdAt': FieldValue.serverTimestamp(), // Optional: Add a timestamp
                                });
                                // Show success message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Client added successfully!')),
                                );

                                // Clear text fields after adding
                                nameController.clear();
                                emailController.clear();
                                passwordController.clear();
                              } catch (e) {
                                // Show error message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Error: $e')),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please fill all fields!')),
                              );
                            }
                          },
                      // Container(
                      //   height: 55,
                      //   width: 300,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(30),
                      //     gradient: const LinearGradient(
                      //         colors: [
                      //           Color.fromARGB(255, 16, 113, 204),
                      //           Color(0xff281537),
                      //         ]
                      //     ),
                      //   ),
                        
                        child:Text('SIGN IN',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white
                        ),),),
                      
                      const SizedBox(height: 80,),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Don't have account?",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),),
                            Text("Sign up",style: TextStyle(///done login page
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black
                            ),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}