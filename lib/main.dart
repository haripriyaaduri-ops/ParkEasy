import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/home_screen.dart';
import 'screens/welcome_screen.dart';
import 'theme_provider.dart';




void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    

    options: DefaultFirebaseOptions.currentPlatform,

  );
  


  runApp(

    ChangeNotifierProvider(

      create: (context) => ThemeProvider(),

      child: const ParkEasyApp(),

    ),

  );

}
class ParkEasyApp extends StatefulWidget {

  const ParkEasyApp({super.key});


  @override
  State<ParkEasyApp> createState() => _ParkEasyAppState();

}



class _ParkEasyAppState extends State<ParkEasyApp> {


  bool? isLogin;



  @override
  void initState() {

    super.initState();

    checkLogin();

  }



  Future<void> checkLogin() async {


    SharedPreferences prefs =
        await SharedPreferences.getInstance();



    bool status =
        prefs.getBool("isLogin") ?? false;



    setState(() {

      isLogin = status;

    });


  }
    @override
  Widget build(BuildContext context) {


    return MaterialApp(


      debugShowCheckedModeBanner: false,


      title: "ParkEasy",



      theme: ThemeData(


        primarySwatch: Colors.blue,


        brightness: Brightness.light,


      ),



      darkTheme: ThemeData(


        brightness: Brightness.dark,


        primarySwatch: Colors.blue,


      ),



      themeMode:

          context.watch<ThemeProvider>().isDark

              ? ThemeMode.dark

              : ThemeMode.light,



      home: isLogin == null


          ? const Scaffold(


              body: Center(


                child: CircularProgressIndicator(),


              ),


            )



          : isLogin!


              ? const HomeScreen()


              : const WelcomeScreen(),



    );


  }


}