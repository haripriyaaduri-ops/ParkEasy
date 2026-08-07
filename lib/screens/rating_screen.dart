import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RatingScreen extends StatefulWidget {

  final String parkingName;

  const RatingScreen({
    super.key,
    required this.parkingName,
  });

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}


class _RatingScreenState extends State<RatingScreen> {

  int rating = 0;

  final reviewController = TextEditingController();


  Future<void> saveReview() async {

    await FirebaseFirestore.instance
        .collection("reviews")
        .add({

      "parkingName": widget.parkingName,

      "rating": rating,

      "review": reviewController.text,

      "createdAt": Timestamp.now(),

    });


    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Review Submitted"),
      ),
    );


    Navigator.pop(context);

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Rate Parking",
          style: TextStyle(color: Colors.white),
        ),

        backgroundColor: Colors.blue,

      ),


      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [


            Text(
              widget.parkingName,
              style: const TextStyle(
                fontSize:22,
                fontWeight:FontWeight.bold,
              ),
            ),


            const SizedBox(height:20),


            Row(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: List.generate(5, (index){

                return IconButton(

                  onPressed:(){

                    setState((){

                      rating=index+1;

                    });

                  },

                  icon: Icon(

                    Icons.star,

                    size:40,

                    color: index < rating
                        ? Colors.amber
                        : Colors.grey,

                  ),

                );

              }),

            ),


            const SizedBox(height:20),


            TextField(

              controller: reviewController,

              maxLines:4,

              decoration: InputDecoration(

                hintText:"Write your review",

                border:OutlineInputBorder(

                  borderRadius:
                  BorderRadius.circular(15),

                ),

              ),

            ),


            const SizedBox(height:20),


            SizedBox(

              width:double.infinity,

              child:ElevatedButton(

                onPressed: rating==0
                    ? null
                    : saveReview,


                child:
                const Text("Submit Review"),

              ),

            )


          ],

        ),

      ),

    );

  }

}