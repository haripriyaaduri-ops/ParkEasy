import 'package:cloud_firestore/cloud_firestore.dart';


Future<void> uploadParkingData() async {


  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;



  List<Map<String, dynamic>> parkingData = [



    {
      "name": "Charminar Parking",
      "city": "Hyderabad",
      "address": "Charminar, Hyderabad",
      "slots": 120,
      "price": 40,
      "latitude": 17.3616,
      "longitude": 78.4747,
    },



    {
      "name": "HITEC City Parking",
      "city": "Hyderabad",
      "address": "HITEC City, Hyderabad",
      "slots": 180,
      "price": 60,
      "latitude": 17.4435,
      "longitude": 78.3772,
    },



    {
      "name": "Gachibowli Parking",
      "city": "Hyderabad",
      "address": "Gachibowli, Hyderabad",
      "slots": 150,
      "price": 50,
      "latitude": 17.4401,
      "longitude": 78.3489,
    },



    {
      "name": "Railway Station Parking",
      "city": "Vijayawada",
      "address": "Railway Station, Vijayawada",
      "slots": 100,
      "price": 40,
      "latitude": 16.5183,
      "longitude": 80.6203,
    },



    {
      "name": "PNBS Parking",
      "city": "Vijayawada",
      "address": "PNBS Bus Stand, Vijayawada",
      "slots": 120,
      "price": 30,
      "latitude": 16.5069,
      "longitude": 80.6488,
    },



    {
      "name": "RK Beach Parking",
      "city": "Visakhapatnam",
      "address": "RK Beach Road, Visakhapatnam",
      "slots": 90,
      "price": 40,
      "latitude": 17.7147,
      "longitude": 83.3237,
    },



    {
      "name": "Visakhapatnam Railway Parking",
      "city": "Visakhapatnam",
      "address": "Railway Station, Visakhapatnam",
      "slots": 130,
      "price": 50,
      "latitude": 17.7220,
      "longitude": 83.3061,
    },



    {
      "name": "MG Road Parking",
      "city": "Bengaluru",
      "address": "MG Road, Bengaluru",
      "slots": 180,
      "price": 60,
      "latitude": 12.9758,
      "longitude": 77.6055,
    },



    {
      "name": "Majestic Parking",
      "city": "Bengaluru",
      "address": "Majestic Bus Stand, Bengaluru",
      "slots": 220,
      "price": 70,
      "latitude": 12.9784,
      "longitude": 77.5720,
    },



    {
      "name": "Chennai Central Parking",
      "city": "Chennai",
      "address": "Chennai Central Railway Station",
      "slots": 200,
      "price": 50,
      "latitude": 13.0827,
      "longitude": 80.2707,
    },


  ];



  for(var parking in parkingData){


    await firestore

        .collection("parkings")

        .add(parking);


  }



  print("Parking Data Uploaded Successfully");


}