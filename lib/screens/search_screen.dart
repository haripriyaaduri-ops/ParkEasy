import 'package:flutter/material.dart';
import 'parking_details_screen.dart';



class SearchScreen extends StatefulWidget {


  const SearchScreen({super.key});


  @override
  State<SearchScreen> createState() => _SearchScreenState();


}




class _SearchScreenState extends State<SearchScreen> {



  TextEditingController searchController =
  TextEditingController();




  List<Map<String,String>> parkingList = [



    {

      "name":"Super Market Parking",

      "slots":"30 Slots Available",

      "price":"₹20/hour",

      "lat":"17.3850",

      "lng":"78.4867",

    },





    {

      "name":"City Mall Parking",

      "slots":"25 Slots Available",

      "price":"₹30/hour",

      "lat":"16.5062",

      "lng":"80.6480",

    },





    {

      "name":"Railway Station Parking",

      "slots":"15 Slots Available",

      "price":"₹40/hour",

      "lat":"13.6288",

      "lng":"79.4192",

    },






    {

      "name":"PVR Parking",

      "slots":"20 Slots Available",

      "price":"₹50/hour",

      "lat":"19.0760",

      "lng":"72.8777",

    },



  ];





  List<Map<String,String>> filteredList=[];





  @override
  void initState(){


    super.initState();


    filteredList = parkingList;


  }






  void searchParking(String value){


    setState((){


      filteredList = parkingList.where((parking){



        return parking["name"]!

            .toLowerCase()

            .contains(value.toLowerCase());



      }).toList();



    });



  }






  @override
  Widget build(BuildContext context) {


    return Scaffold(



      appBar:AppBar(


        title:const Text(


          "Search Parking",


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




            TextField(



              controller:searchController,



              onChanged:searchParking,



              decoration:InputDecoration(



                hintText:"Search Parking",



                prefixIcon:const Icon(



                  Icons.search,


                  color:Colors.blue,



                ),





                border:OutlineInputBorder(



                  borderRadius:
                  BorderRadius.circular(15),



                ),



              ),



            ),






            const SizedBox(height:20),





            Expanded(



              child:ListView.builder(



                itemCount:filteredList.length,



                itemBuilder:(context,index){



                  var parking =
                  filteredList[index];





                  return Card(



                    elevation:3,



                    margin:
                    const EdgeInsets.only(bottom:12),





                    child:ListTile(




                      leading:const CircleAvatar(



                        backgroundColor:
                        Colors.blue,



                        child:Icon(



                          Icons.local_parking,


                          color:Colors.white,



                        ),



                      ),






                      title:Text(



                        parking["name"]!,



                        style:const TextStyle(



                          fontWeight:
                          FontWeight.bold,


                        ),



                      ),





                      subtitle:Text(



                        parking["slots"]!,



                      ),






                      trailing:Text(



                        parking["price"]!,



                        style:const TextStyle(



                          color:Colors.green,


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
                              parking["name"]!,



                              slots:
                              parking["slots"]!,



                              price:
                              parking["price"]!,



                              latitude:
                              parking["lat"]!,



                              longitude:
                              parking["lng"]!,



                            ),



                          ),



                        );



                      },





                    ),



                  );




                },



              ),



            ),



          ],



        ),



      ),



    );



  }


}