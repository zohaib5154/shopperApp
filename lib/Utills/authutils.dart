
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopperapp/Dashboard/bottombar/bottombar.dart';
import 'package:shopperapp/utills/constants.dart';
import 'package:shopperapp/widgets/customdialog.dart';



class AuthUtils{

  registerUser(
      String imageLink,
      String name,
      String email,
      String phoneNo,
      String password,
      BuildContext context
      )async{
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) {

//         })
     FirebaseFirestore.instance.collection("users").doc(firebaseAuth.currentUser!.uid).set(
        {
          'UserName':name,
          'Email':email,
          'imageLink':imageLink,
          "phoneNumber":phoneNo,

        }
      )
            .then((value) {
          Customdialog().showInSnackBar("Logged in", context);
          Customdialog.closeDialog(context);
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (_) => Example()), (
              route) => false);

        });
      }  ).catchError((onError){
        throw onError;


      });
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);

      Customdialog.showBox(context,e.toString());


    }
  }

  loginUser(
      String email,
      String password,
      BuildContext context,
      )async{
    try{
      Customdialog.showDialogBox(context);
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        Customdialog().showInSnackBar("Logged in", context);
        Customdialog.closeDialog(context);
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (_) =>Example()), (
            route) => false);
        // });
      }  ).catchError((onError){
        throw onError;
      });
    }
    catch(e){
      Navigator.pop(context);
      Customdialog.showBox(context,e.toString());
    }
  }
  resetPassword(String email,BuildContext context)async{
    try{
      await    firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
        Customdialog.closeDialog(context);
        Customdialog.closeDialog(context);
        Customdialog.closeDialog(context);
        Customdialog().showInSnackBar("Please Check your email and Password", context);
      }).catchError((e){
        throw e;
      });
    }
    catch(e){
      Navigator.pop(context);
      Customdialog.showBox(context,e.toString());
    }
  }

}
