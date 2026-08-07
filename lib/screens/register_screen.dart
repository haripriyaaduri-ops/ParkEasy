import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login_screen.dart';



class RegisterScreen extends StatefulWidget {

  const RegisterScreen({super.key});


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}



class _RegisterScreenState extends State<RegisterScreen> {


  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();



  bool loading = false;



  Future<void> registerUser() async {


    if(nameController.text.isEmpty ||
       emailController.text.isEmpty ||
       passwordController.text.isEmpty){


      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(

          content: Text(
            "Fill all details",
          ),

        ),

      );


      return;

    }
        try {


      setState(() {

        loading = true;

      });



      UserCredential userCredential =

          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(


        email: emailController.text.trim(),


        password: passwordController.text.trim(),


      );



      User? user = userCredential.user;



      if(user != null){


        await FirebaseFirestore.instance

            .collection("users")

            .doc(user.uid)

            .set({


          "name": nameController.text.trim(),


          "email": emailController.text.trim(),


          "createdAt": Timestamp.now(),


        });


      }



      ScaffoldMessenger.of(context).showSnackBar(


        const SnackBar(


          content: Text(

            "Registration Successful",

          ),


        ),


      );
            Navigator.pushReplacement(


        context,


        MaterialPageRoute(


          builder:(context)=>const LoginScreen(),


        ),


      );



    } on FirebaseAuthException catch(e){



      ScaffoldMessenger.of(context).showSnackBar(


        SnackBar(


          content: Text(


            e.message ?? "Registration Failed",


          ),


        ),


      );



    } catch(e){


      ScaffoldMessenger.of(context).showSnackBar(


        SnackBar(


          content: Text(


            e.toString(),

          ),


        ),


      );


    } finally {


      setState(() {


        loading = false;


      });


    }


  }
    @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(


        title: const Text(
          "Register",
        ),


        backgroundColor: Colors.blue,


      ),



      body: SingleChildScrollView(


        padding: const EdgeInsets.all(24),



        child: Column(


          children: [



            const SizedBox(height: 30),



            const Icon(


              Icons.person_add,


              size: 90,


              color: Colors.blue,


            ),



            const SizedBox(height: 20),



            const Text(


              "Create Account",


              style: TextStyle(


                fontSize: 28,


                fontWeight: FontWeight.bold,


              ),


            ),



            const SizedBox(height: 30),



            TextField(


              controller: nameController,


              decoration: InputDecoration(


                labelText: "Full Name",


                prefixIcon: const Icon(Icons.person),


                border: OutlineInputBorder(


                  borderRadius: BorderRadius.circular(12),


                ),


              ),


            ),



            const SizedBox(height: 20),



            TextField(


              controller: emailController,


              decoration: InputDecoration(


                labelText: "Email",


                prefixIcon: const Icon(Icons.email),


                border: OutlineInputBorder(


                  borderRadius: BorderRadius.circular(12),


                ),


              ),


            ),



            const SizedBox(height: 20),



            TextField(


              controller: passwordController,


              obscureText: true,


              decoration: InputDecoration(


                labelText: "Password",


                prefixIcon: const Icon(Icons.lock),


                border: OutlineInputBorder(


                  borderRadius: BorderRadius.circular(12),


                ),


              ),


            ),



            const SizedBox(height: 30),



            SizedBox(


              width: double.infinity,


              height: 50,



              child: ElevatedButton(


                onPressed: loading ? null : registerUser,


                child: loading


                    ? const CircularProgressIndicator(

                        color: Colors.white,

                      )


                    : const Text(


                        "Register",


                        style: TextStyle(

                          fontSize: 18,

                        ),


                      ),


              ),


            ),



            const SizedBox(height: 15),



            TextButton(


              onPressed: (){


                Navigator.pushReplacement(


                  context,


                  MaterialPageRoute(


                    builder:(context)=>const LoginScreen(),


                  ),


                );


              },


              child: const Text(


                "Already have account? Login",


              ),


            ),



          ],


        ),


      ),


    );


  }


}