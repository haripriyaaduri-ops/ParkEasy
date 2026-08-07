import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';



class MapScreen extends StatelessWidget {


  final String parkingName;
  final double latitude;
  final double longitude;

  final String address;
  final String slots;
  final String price;



  const MapScreen({


    super.key,


    required this.parkingName,


    required this.latitude,


    required this.longitude,


    required this.address,


    required this.slots,


    required this.price,


  });






  @override
  Widget build(BuildContext context) {


    return Scaffold(



      appBar: AppBar(


        title: Text(


          parkingName,


          style: const TextStyle(


            color: Colors.white,


            fontWeight: FontWeight.bold,


          ),


        ),



        backgroundColor: Colors.blue,


        centerTitle: true,


      ),






      body: FlutterMap(



        options: MapOptions(



          initialCenter: LatLng(



            latitude,


            longitude,


          ),




          initialZoom: 15,



        ),






        children: [





          TileLayer(



            urlTemplate:

            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",




            userAgentPackageName:

            "com.example.parkeasy",



          ),






          MarkerLayer(



            markers: [




              Marker(



                point: LatLng(



                  latitude,


                  longitude,



                ),





                width: 120,



                height: 120,






                child: GestureDetector(



                  onTap: () {



                    showDialog(



                      context: context,



                      builder: (context) {



                        return AlertDialog(



                          title: Text(



                            parkingName,



                            style: const TextStyle(



                              fontWeight: FontWeight.bold,



                            ),



                          ),





                          content: Text(



                            """
Address:
$address


Available Slots:
$slots


Price:
$price/hour


Status:
Available for booking
""",



                            style: const TextStyle(



                              fontSize: 16,



                            ),



                          ),





                          actions: [



                            TextButton(



                              onPressed: () {



                                Navigator.pop(context);



                              },



                              child: const Text(



                                "Close",



                              ),



                            ),



                          ],



                        );



                      },



                    );



                  },






                  child: const Icon(



                    Icons.location_on,



                    color: Colors.red,



                    size: 50,



                  ),



                ),



              ),





            ],



          ),





        ],



      ),



    );



  }


}