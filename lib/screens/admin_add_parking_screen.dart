import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AdminAddParkingScreen extends StatefulWidget {

  const AdminAddParkingScreen({super.key});


  @override
  State<AdminAddParkingScreen> createState() =>
      _AdminAddParkingScreenState();

}



class _AdminAddParkingScreenState
    extends State<AdminAddParkingScreen> {


  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final slotsController = TextEditingController();
  final priceController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();



  Future<void> addParking() async {


    await FirebaseFirestore.instance
        .collection("parkings")
        .add({

      "name": nameController.text,

      "address": addressController.text,

      "slots": int.parse(slotsController.text),

      "price": int.parse(priceController.text),

      "latitude":
      double.parse(latitudeController.text),

      "longitude":
      double.parse(longitudeController.text),

    });



    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content:
        Text("Parking Added Successfully"),

      ),

    );



    Navigator.pop(context);


  }







  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title: const Text(
          "Add Parking",
          style: TextStyle(
            color: Colors.white,
          ),
        ),

        backgroundColor: Colors.blue,

      ),




      body: Padding(

        padding: const EdgeInsets.all(20),


        child: SingleChildScrollView(


          child: Column(


            children: [



              TextField(

                controller:nameController,

                decoration:
                const InputDecoration(

                  labelText:"Parking Name",

                  border:
                  OutlineInputBorder(),

                ),

              ),



              const SizedBox(height:15),




              TextField(

                controller:addressController,

                decoration:
                const InputDecoration(

                  labelText:"Address",

                  border:
                  OutlineInputBorder(),

                ),

              ),




              const SizedBox(height:15),




              TextField(

                controller:slotsController,

                keyboardType:
                TextInputType.number,

                decoration:
                const InputDecoration(

                  labelText:"Available Slots",

                  border:
                  OutlineInputBorder(),

                ),

              ),





              const SizedBox(height:15),





              TextField(

                controller:priceController,

                keyboardType:
                TextInputType.number,

                decoration:
                const InputDecoration(

                  labelText:"Price / Hour",

                  border:
                  OutlineInputBorder(),

                ),

              ),




              const SizedBox(height:15),




              TextField(

                controller:latitudeController,

                decoration:
                const InputDecoration(

                  labelText:"Latitude",

                  border:
                  OutlineInputBorder(),

                ),

              ),




              const SizedBox(height:15),




              TextField(

                controller:longitudeController,

                decoration:
                const InputDecoration(

                  labelText:"Longitude",

                  border:
                  OutlineInputBorder(),

                ),

              ),




              const SizedBox(height:25),





              SizedBox(

                width:double.infinity,


                child:ElevatedButton(


                  onPressed:addParking,


                  style:
                  ElevatedButton.styleFrom(

                    backgroundColor:
                    Colors.blue,

                    padding:
                    const EdgeInsets.all(15),

                  ),


                  child:
                  const Text(

                    "Add Parking",

                    style:
                    TextStyle(

                      color:Colors.white,

                      fontSize:18,

                    ),

                  ),


                ),

              )



            ],


          ),


        ),


      ),


    );


  }


}