import 'package:flutter/material.dart';

import 'parking_details_screen.dart';
import 'search_screen.dart';
import 'profile_screen.dart';
import 'history_screen.dart';



class HomeScreen extends StatelessWidget {


  const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {


    return Scaffold(



      appBar: AppBar(


        title: const Text(


          "ParkEasy",


          style: TextStyle(


            color: Colors.white,

            fontWeight: FontWeight.bold,


          ),


        ),


        backgroundColor: Colors.blue,

        centerTitle:true,


      ),




      body: Padding(


        padding:const EdgeInsets.all(20),



        child:Column(



          crossAxisAlignment:
          CrossAxisAlignment.start,



          children:[




            const Text(


              "Hello, Driver 👋",


              style:TextStyle(


                fontSize:26,

                fontWeight:FontWeight.bold,


              ),


            ),




            const SizedBox(height:25),





            GestureDetector(



              onTap:(){



                Navigator.push(



                  context,

                  MaterialPageRoute(



                    builder:(context)=>

                    const SearchScreen(),



                  ),



                );



              },



              child:Container(



                padding:
                const EdgeInsets.all(15),



                decoration:BoxDecoration(



                  color:Colors.grey.shade200,

                  borderRadius:
                  BorderRadius.circular(15),



                ),



                child:const Row(



                  children:[



                    Icon(

                      Icons.search,

                      color:Colors.blue,

                    ),




                    SizedBox(width:10),




                    Text(

                      "Search Parking",

                    ),



                  ],



                ),



              ),



            ),





            const SizedBox(height:25),





            const Text(



              "Available Parking",



              style:TextStyle(



                fontSize:22,

                fontWeight:FontWeight.bold,



              ),



            ),





            const SizedBox(height:15),





            Expanded(



              child:ListView(



                children:[



                  parkingCard(


                    context,


                    "Super Market Parking",


                    "30 Slots Available",


                    "₹20/hour",


                  ),





                  parkingCard(


                    context,


                    "City Mall Parking",


                    "20 Slots Available",


                    "₹30/hour",


                  ),






                  parkingCard(


                    context,


                    "Railway Station Parking",


                    "15 Slots Available",


                    "₹40/hour",


                  ),






                  parkingCard(


                    context,


                    "PVR Parking",


                    "25 Slots Available",


                    "₹50/hour",


                  ),




                ],



              ),



            ),



          ],



        ),



      ),





      bottomNavigationBar:
      BottomNavigationBar(



        items:const[



          BottomNavigationBarItem(


            icon:Icon(Icons.home),


            label:"Home",


          ),




          BottomNavigationBarItem(


            icon:Icon(Icons.history),


            label:"History",


          ),




          BottomNavigationBarItem(


            icon:Icon(Icons.person),


            label:"Profile",


          ),



        ],




        onTap:(index){



          if(index==1){



            Navigator.push(



              context,

              MaterialPageRoute(



                builder:(context)=>

                const HistoryScreen(),



              ),



            );



          }




          if(index==2){



            Navigator.push(



              context,

              MaterialPageRoute(



                builder:(context)=>

                const ProfileScreen(),



              ),



            );



          }



        },



      ),



    );



  }






  static Widget parkingCard(


      BuildContext context,


      String name,


      String slots,


      String price,


      ){





    return Card(



      elevation:5,



      margin:
      const EdgeInsets.only(bottom:15),




      child:ListTile(



        leading:const CircleAvatar(



          backgroundColor:Colors.blue,



          child:Icon(



            Icons.local_parking,


            color:Colors.white,



          ),



        ),




        title:Text(



          name,



          style:const TextStyle(



            fontWeight:FontWeight.bold,


          ),



        ),





        subtitle:Text(slots),





        trailing:Text(



          price,



          style:const TextStyle(



            color:Colors.green,


            fontWeight:FontWeight.bold,


          ),



        ),






        onTap:(){



          String lat="";
          String lng="";



          if(name=="Super Market Parking"){


            lat="17.3850";

            lng="78.4867";


          }

          else if(name=="City Mall Parking"){


            lat="16.5062";

            lng="80.6480";


          }

          else if(name=="Railway Station Parking"){


            lat="13.6288";

            lng="79.4192";


          }

          else if(name=="PVR Parking"){


            lat="19.0760";

            lng="72.8777";


          }




          Navigator.push(



            context,



            MaterialPageRoute(



              builder:(context)=>

              ParkingDetails(



                name:name,


                slots:slots,


                price:price,


                latitude:lat,


                longitude:lng,



              ),



            ),



          );



        },



      ),



    );



  }



}