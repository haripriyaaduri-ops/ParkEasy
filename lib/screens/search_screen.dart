import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'parking_details_screen.dart';


class SearchScreen extends StatefulWidget {

  const SearchScreen({super.key});


  @override
  State<SearchScreen> createState() => _SearchScreenState();

}



class _SearchScreenState extends State<SearchScreen> {


  final searchController = TextEditingController();


  String searchText = "";



  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(


        title: const Text(

          "Search Parking",

          style: TextStyle(

            color: Colors.white,

          ),

        ),


        backgroundColor: Colors.blue,

      ),





      body: Padding(


        padding: const EdgeInsets.all(20),



        child: Column(


          children: [



            TextField(



              controller: searchController,



              decoration: InputDecoration(



                hintText: "Search parking name",



                prefixIcon:
                const Icon(Icons.search),



                border:
                OutlineInputBorder(



                  borderRadius:
                  BorderRadius.circular(15),



                ),



              ),




              onChanged:(value){



                setState((){



                  searchText =
                  value.toLowerCase();



                });



              },



            ),





            const SizedBox(height:20),





            Expanded(



              child:
              StreamBuilder<QuerySnapshot>(



                stream:
                FirebaseFirestore.instance

                    .collection("parkings")

                    .snapshots(),




                builder:(context,snapshot){



                  if(!snapshot.hasData){



                    return const Center(

                      child:
                      CircularProgressIndicator(),

                    );



                  }






                  var parkings =
                  snapshot.data!.docs.where((doc){



                    String name =
                    doc["name"].toString()
                        .toLowerCase();




                    return name.contains(searchText);



                  }).toList();







                  if(parkings.isEmpty){



                    return const Center(



                      child:Text(

                        "No Parking Found",

                        style:
                        TextStyle(

                          fontSize:20,

                        ),

                      ),



                    );



                  }








                  return ListView.builder(



                    itemCount:
                    parkings.length,




                    itemBuilder:(context,index){



                      var parking =
                      parkings[index];




                      return Card(



                        elevation:5,



                        child:ListTile(



                          leading:
                          const CircleAvatar(



                            backgroundColor:
                            Colors.blue,



                            child:
                            Icon(

                              Icons.local_parking,

                              color:
                              Colors.white,

                            ),



                          ),





                          title:Text(

                            parking["name"],

                          ),




                          subtitle:Text(

                            parking["address"],

                          ),





                          trailing:Text(

                            "₹${parking["price"]}",

                            style:
                            const TextStyle(

                              color:
                              Colors.green,

                              fontWeight:
                              FontWeight.bold,

                            ),

                          ),






                          onTap:(){



                            Navigator.push(



                              context,



                              MaterialPageRoute(



                                builder:(context)=>

                                ParkingDetails(



                                  name:
                                  parking["name"],



                                  slots:
                                  "${parking["slots"]} Slots Available",



                                  price:
                                  "₹${parking["price"]}",



                                  latitude:
                                  parking["latitude"].toString(),



                                  longitude:
                                  parking["longitude"].toString(),



                                ),



                              ),



                            );



                          },



                        ),



                      );



                    },



                  );



                },



              ),



            )



          ],



        ),



      ),



    );



  }


}