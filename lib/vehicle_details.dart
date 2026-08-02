import 'package:flutter/material.dart';
import '../slot_selection.dart';

class VehicleDetails extends StatefulWidget {

  const VehicleDetails({super.key});


  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();

}


class _VehicleDetailsState extends State<VehicleDetails> {


  final vehicleNumberController = TextEditingController();


  String vehicleType = "Car";



  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title: const Text(

          "Vehicle Details",

          style: TextStyle(

            color: Colors.white,

          ),

        ),

        backgroundColor: Colors.blue,

        centerTitle: true,

      ),



      body: Padding(


        padding: const EdgeInsets.all(20),



        child: Column(



          crossAxisAlignment: CrossAxisAlignment.start,



          children: [



            const Text(

              "Enter Vehicle Details",

              style: TextStyle(

                fontSize:24,

                fontWeight:FontWeight.bold,

              ),

            ),



            const SizedBox(height:25),




            TextField(



              controller: vehicleNumberController,



              decoration: InputDecoration(



                labelText:"Vehicle Number",



                hintText:"AP16AB1234",



                border:OutlineInputBorder(



                  borderRadius:BorderRadius.circular(15),



                ),



              ),



            ),




            const SizedBox(height:20),




            const Text(



              "Vehicle Type",



              style:TextStyle(



                fontSize:18,

                fontWeight:FontWeight.bold,



              ),



            ),




            DropdownButton<String>(



              value: vehicleType,



              isExpanded:true,



              items:[



                "Car",

                "Bike",

                "Auto",



              ].map((type){



                return DropdownMenuItem(



                  value:type,



                  child:Text(type),



                );



              }).toList(),



              onChanged:(value){



                setState(() {



                  vehicleType=value!;



                });



              },



            ),




            const SizedBox(height:40),




            SizedBox(



              width:double.infinity,



              child:ElevatedButton(



                onPressed:(){



                  if(vehicleNumberController.text.isEmpty){



                    ScaffoldMessenger.of(context).showSnackBar(



                      const SnackBar(



                        content:Text(

                          "Enter Vehicle Number",

                        ),

                      ),



                    );



                  }

                  else {



                    Navigator.push(



                      context,



                      MaterialPageRoute(



                       builder:(context)=>SlotSelection(
  vehicleNumber: vehicleNumberController.text,
  vehicleType: vehicleType,
),



                      ),



                    );



                  }



                },



                style:ElevatedButton.styleFrom(



                  backgroundColor:Colors.blue,

                  padding:const EdgeInsets.all(15),



                ),



                child:const Text(



                  "Continue",



                  style:TextStyle(



                    color:Colors.white,

                    fontSize:18,



                  ),



                ),



              ),



            ),



          ],



        ),



      ),



    );



  }


}