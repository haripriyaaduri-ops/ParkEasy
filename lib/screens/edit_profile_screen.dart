import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class EditProfileScreen extends StatefulWidget {


  const EditProfileScreen({super.key});


  @override
  State<EditProfileScreen> createState() =>
      _EditProfileScreenState();


}





class _EditProfileScreenState
    extends State<EditProfileScreen> {



  final nameController =
      TextEditingController();


  final emailController =
      TextEditingController();


  final vehicleNumberController =
      TextEditingController();



  String vehicleType = "Car";


  bool loading = true;




  @override
  void initState(){

    super.initState();

    loadUserData();

  }






  Future<void> loadUserData() async {


    final user =
        FirebaseAuth.instance.currentUser;



    final snapshot =
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user!.uid)
            .get();



    if(snapshot.exists){


      final data =
          snapshot.data()!;



      nameController.text =
          data["name"] ?? "";



      emailController.text =
          data["email"] ?? "";



      vehicleNumberController.text =
          data["vehicleNumber"] ?? "";



      vehicleType =
          data["vehicleType"] ?? "Car";


    }



    setState(() {


      loading = false;


    });


  }







  Future<void> updateProfile() async {



    final user =
        FirebaseAuth.instance.currentUser;




    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .update({



      "name":
      nameController.text.trim(),



      "email":
      emailController.text.trim(),



      "vehicleType":
      vehicleType,



      "vehicleNumber":
      vehicleNumberController.text.trim(),



    });





    ScaffoldMessenger.of(context)
        .showSnackBar(



      const SnackBar(

        content:
        Text(
          "Profile Updated Successfully",
        ),

      ),



    );





    Navigator.pop(context);



  }








  @override
  Widget build(BuildContext context) {



    return Scaffold(



      appBar: AppBar(



        title:
        const Text(

          "Edit Profile",

          style:
          TextStyle(

            color:Colors.white,

          ),

        ),



        backgroundColor:
        Colors.blue,

        centerTitle:true,



      ),






      body:



      loading



          ? const Center(

        child:
        CircularProgressIndicator(),

      )



          :

      Padding(



        padding:
        const EdgeInsets.all(20),



        child:
        Column(



          children:[





            TextField(



              controller:
              nameController,



              decoration:
              InputDecoration(



                labelText:
                "Name",



                border:
                OutlineInputBorder(



                  borderRadius:
                  BorderRadius.circular(15),



                ),



              ),



            ),





            const SizedBox(height:15),






            TextField(



              controller:
              emailController,



              decoration:
              InputDecoration(



                labelText:
                "Email",



                border:
                OutlineInputBorder(



                  borderRadius:
                  BorderRadius.circular(15),



                ),



              ),



            ),






            const SizedBox(height:15),






            DropdownButtonFormField<String>(



              value:
              vehicleType,



              decoration:
              InputDecoration(



                labelText:
                "Vehicle Type",



                border:
                OutlineInputBorder(



                  borderRadius:
                  BorderRadius.circular(15),



                ),



              ),




              items:[

                "Car",

                "Bike",

                "Auto",

              ]

                  .map((e)=>DropdownMenuItem(



                value:e,



                child:
                Text(e),



              ))

                  .toList(),





              onChanged:(value){



                setState((){



                  vehicleType =
                  value!;



                });



              },



            ),






            const SizedBox(height:15),






            TextField(



              controller:
              vehicleNumberController,



              decoration:
              InputDecoration(



                labelText:
                "Vehicle Number",



                border:
                OutlineInputBorder(



                  borderRadius:
                  BorderRadius.circular(15),



                ),



              ),



            ),






            const Spacer(),






            SizedBox(



              width:
              double.infinity,



              child:
              ElevatedButton(



                onPressed:
                updateProfile,



                style:
                ElevatedButton.styleFrom(



                  backgroundColor:
                  Colors.blue,



                  padding:
                  const EdgeInsets.all(15),



                ),



                child:
                const Text(



                  "Save Changes",



                  style:
                  TextStyle(



                    color:
                    Colors.white,



                    fontSize:
                    18,



                  ),



                ),



              ),



            )





          ],



        ),



      ),



    );



  }


}