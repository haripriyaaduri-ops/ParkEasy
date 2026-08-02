import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'edit_profile_screen.dart';
import 'login_screen.dart';
import '../user_data.dart';
import '../theme_provider.dart';



class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}



class _ProfileScreenState extends State<ProfileScreen> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar:AppBar(


        title:const Text(

          "Profile",

          style:TextStyle(

            color:Colors.white,

          ),

        ),


        backgroundColor:Colors.blue,

        centerTitle:true,


      ),




      body:Padding(


        padding:const EdgeInsets.all(20),



        child:Column(



          children:[



            const CircleAvatar(



              radius:50,



              backgroundColor:Colors.blue,



              child:Icon(



                Icons.person,

                size:60,

                color:Colors.white,


              ),



            ),




            const SizedBox(height:20),




            Text(



              UserData.name,



              style:const TextStyle(



                fontSize:26,

                fontWeight:FontWeight.bold,


              ),



            ),




            const SizedBox(height:25),




            profileItem(

              Icons.person,

              "Name",

              UserData.name,

            ),





            profileItem(

              Icons.email,

              "Email",

              UserData.email,

            ),





            profileItem(

              Icons.directions_car,

              "Vehicle Type",

              UserData.vehicleType,

            ),





            profileItem(

              Icons.confirmation_number,

              "Vehicle Number",

              UserData.vehicleNumber,

            ),




            const SizedBox(height:10),




            // Dark Mode

            Card(


              elevation:3,


              child:SwitchListTile(



                title:const Text(



                  "Dark Mode",



                  style:TextStyle(



                    fontWeight:FontWeight.bold,


                  ),



                ),




                secondary:const Icon(



                  Icons.dark_mode,

                  color:Colors.blue,


                ),





                value:

                context.watch<ThemeProvider>().isDark,





                onChanged:(value){



                  context

                  .read<ThemeProvider>()

                  .toggleTheme();



                },



              ),



            ),





            const SizedBox(height:20),





            SizedBox(



              width:double.infinity,



              child:ElevatedButton(



                onPressed:() async {




                  await Navigator.push(



                    context,



                    MaterialPageRoute(



                      builder:(context)=>

                      const EditProfileScreen(),



                    ),



                  );




                  setState((){});



                },



                style:ElevatedButton.styleFrom(



                  backgroundColor:Colors.blue,

                  padding:const EdgeInsets.all(15),



                ),




                child:const Text(



                  "Edit Profile",




                  style:TextStyle(



                    color:Colors.white,

                    fontSize:18,


                  ),



                ),



              ),



            ),





            const SizedBox(height:15),





            SizedBox(



              width:double.infinity,



              child:OutlinedButton(



                onPressed:() async {



                  SharedPreferences prefs =

                  await SharedPreferences.getInstance();




                  await prefs.setBool(



                    "isLogin",



                    false,



                  );






                  Navigator.pushReplacement(



                    context,



                    MaterialPageRoute(



                      builder:(context)=>

                      const LoginScreen(),



                    ),



                  );



                },



                child:const Text(



                  "Logout",



                  style:TextStyle(



                    color:Colors.red,


                  ),



                ),



              ),



            )




          ],



        ),



      ),



    );



  }







  Widget profileItem(



    IconData icon,

    String title,

    String value,



  ){



    return Card(



      elevation:3,



      margin:const EdgeInsets.only(bottom:12),



      child:ListTile(



        leading:Icon(



          icon,

          color:Colors.blue,


        ),




        title:Text(



          title,



          style:const TextStyle(



            fontWeight:FontWeight.bold,


          ),



        ),




        subtitle:Text(value),



      ),



    );



  }



}