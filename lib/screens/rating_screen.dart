import 'package:flutter/material.dart';


class RatingScreen extends StatefulWidget {

  const RatingScreen({super.key});


  @override
  State<RatingScreen> createState() => _RatingScreenState();

}



class _RatingScreenState extends State<RatingScreen> {


  int rating = 0;

  final reviewController = TextEditingController();



  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        backgroundColor: Colors.blue,

        centerTitle:true,

        title: const Text(

          "Rate Parking",

          style: TextStyle(

            color: Colors.white,

            fontWeight: FontWeight.bold,

          ),

        ),

      ),



      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [


            const Text(

              "How was your parking experience?",

              style: TextStyle(

                fontSize:22,

                fontWeight:FontWeight.bold,

              ),

            ),



            const SizedBox(height:30),



            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: List.generate(5, (index){


                return IconButton(


                  onPressed:(){

                    setState((){

                      rating = index + 1;

                    });


                  },


                  icon:Icon(


                    index < rating

                        ? Icons.star

                        : Icons.star_border,


                    size:45,


                    color:Colors.orange,


                  ),


                );


              }),

            ),



            const SizedBox(height:30),



            TextField(


              controller:reviewController,


              maxLines:5,


              decoration:InputDecoration(


                hintText:"Write your review...",


                border:OutlineInputBorder(


                  borderRadius:BorderRadius.circular(15),


                ),


              ),


            ),



            const SizedBox(height:30),



            SizedBox(


              width:double.infinity,


              child:ElevatedButton(


                onPressed:(){


                  if(rating == 0){


                    ScaffoldMessenger.of(context).showSnackBar(


                      const SnackBar(


                        content:Text(

                          "Please select rating",

                        ),

                      ),

                    );


                  }

                  else{


                    ScaffoldMessenger.of(context).showSnackBar(


                      const SnackBar(


                        content:Text(

                          "Thank you for your feedback ⭐",

                        ),

                      ),

                    );


                    Navigator.pop(context);


                  }


                },


                style:ElevatedButton.styleFrom(


                  backgroundColor:Colors.blue,

                  padding:const EdgeInsets.all(15),

                ),



                child:const Text(


                  "Submit Review",


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