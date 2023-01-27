import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopperapp/auth/login_screen.dart';
import 'package:shopperapp/dashboard/bottombar/bottombar.dart';
import 'package:shopperapp/utills/constants.dart';





class AppSplashUI extends StatefulWidget {
  @override
  _AppSplashUIState createState() => _AppSplashUIState();
}

class _AppSplashUIState extends State<AppSplashUI> {
  Future<void> startTimer() async {

    Timer(
        Duration(seconds: 4),
            () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>LoginScreen()),
                (Route<dynamic> route) => false)

    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseAuth
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoginScreen()), (route) => false);

      } else {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Example ()), (route) => false);
      }
    });

  }

  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    var Size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(milliseconds:  900),
          tween: Tween<double>( begin: 2.0*25,end: 0),
          builder: (context,double val,child){
            return Padding(
                padding: EdgeInsets.only(
                    top: val,
                    left: val,
                    right: val
                ),
                // top: val,
                // left: val,
                // right: val,
                child: child!);
          },
          child: SizedBox(
            height: Size.height*0.9,
            width: Size.width,
            child:
            // Text("jdjsdgf")

            Image.asset( "assets/images/applogo.png",
              // scale: 5,
              fit: BoxFit.scaleDown,
            ),

          ),
        ),
      ),
    );
  }
}
