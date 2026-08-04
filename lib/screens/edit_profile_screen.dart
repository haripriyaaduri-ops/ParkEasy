import 'package:flutter/material.dart';
import '../user_data.dart';



class EditProfileScreen extends StatefulWidget {


  const EditProfileScreen({super.key});


  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();


}




class _EditProfileScreenState extends State<EditProfileScreen> {


  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController vehicleNumberController;


  String vehicleType = "Car";



  @override
  void initState() {

    super.initState();


    nameController =
        TextEditingController(text: UserData.name);


    emailController =
        TextEditingController(text: UserData.email);


    vehicleNumberController =
        TextEditingController(text: UserData.vehicleNumber);


    vehicleType = UserData.vehicleType;


  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(


        title: const Text(

          "Edit Profile",

          style: TextStyle(

            color: Colors.white,

          ),

        ),


        backgroundColor: Colors.blue,

        centerTitle:true,


      ),




      body: Padding(


        padding: const EdgeInsets.all(20),



        child: Column(


          children:[



            TextField(


              controller:nameController,


              decoration:InputDecoration(


                labelText:"Name",


                border:OutlineInputBorder(


                  borderRadius:BorderRadius.circular(15),


                ),


              ),


            ),



            const SizedBox(height:15),




            TextField(


              controller:emailController,


              decoration:InputDecoration(


                labelText:"Email",


                border:OutlineInputBorder(


                  borderRadius:BorderRadius.circular(15),


                ),


              ),


            ),




            const SizedBox(height:15),




            DropdownButtonFormField<String>(


              value:vehicleType,


              decoration:InputDecoration(


                labelText:"Vehicle Type",


                border:OutlineInputBorder(


                  borderRadius:BorderRadius.circular(15),


                ),


              ),



              items:[

                "Car",

                "Bike",

                "Auto",

              ]

              .map((e)=>DropdownMenuItem(


                value:e,


                child:Text(e),


              ))

              .toList(),



              onChanged:(value){


                setState((){


                  vehicleType=value!;


                });


              },


            ),





            const SizedBox(height:15),




            TextField(


              controller:vehicleNumberController,


              decoration:InputDecoration(


                labelText:"Vehicle Number",


                border:OutlineInputBorder(


                  borderRadius:BorderRadius.circular(15),


                ),


              ),


            ),





            const Spacer(),





            SizedBox(


              width:double.infinity,


              child:ElevatedButton(


                onPressed:(){



                  UserData.name =
                  nameController.text;


                  UserData.email =
                  emailController.text;


                  UserData.vehicleType =
                  vehicleType;


                  UserData.vehicleNumber =
                  vehicleNumberController.text;




                  Navigator.pop(context);



                },



                style:ElevatedButton.styleFrom(


                  backgroundColor:Colors.blue,


                  padding:const EdgeInsets.all(15),


                ),



                child:const Text(


                  "Save Changes",


                  style:TextStyle(


                    color:Colors.white,


                    fontSize:18,


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