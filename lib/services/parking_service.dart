import 'package:cloud_firestore/cloud_firestore.dart';


class ParkingService {


  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;



  Stream<QuerySnapshot> getParkings(){


    return firestore
        .collection("parkings")
        .snapshots();


  }


}