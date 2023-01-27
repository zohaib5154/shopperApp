
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:shopperapp/Auth/login_screen.dart';
import 'package:shopperapp/Dashboard/settings/userupdate_screen.dart';
import 'package:shopperapp/Utills/constants.dart';
import 'package:shopperapp/utills/colors.dart';





class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  File? imageUrl;
  String? imageLink;
  @override
  Widget build(BuildContext context) {
    var appSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        backgroundColor: themeColor,

        title: Text("Setting",style: TextStyle(
          color: Colors.white,



        ),),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(


              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: appSize.height*0.4,

                  width: appSize.width,
                  child: StreamBuilder(
                      stream: firebaseFirestore.collection("users").doc(firebaseAuth.currentUser!.uid).snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasData) {
                          var ds= snapshot.data!;
                          return Column(children: [
                            GestureDetector(
                              onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>UserUpdateScreen(
                                    id: ds.id,
                                    username:ds.get("UserName"),
                                 phone :ds.get("phoneNumber"),


                                )));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: appSize.height*0.01,right: appSize.width*0.02),
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.edit,color: Colors.black,)),
                            ),
                            SizedBox(height: appSize.height*0.02,),
                            Container(
                                height: appSize.height*0.09,
                                width: appSize.width*.16,
                                decoration:BoxDecoration(
                                    color: themeColor,

                                    shape: BoxShape.circle) ,
                                child:


                                CircleAvatar(
                                  radius: 80,
                                  backgroundColor:themeColor,
                                  backgroundImage: NetworkImage(ds.get("imageLink"),scale: 10,),
                                )
                            ),



                            Padding(
                              padding:  EdgeInsets.only(left: appSize.width*0.02,right: appSize.width*0.02,top: appSize.height*0.05),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Username",style: TextStyle(color: Colors.grey,fontSize: appSize.width*0.039,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                                  Text
                                    (ds.get("UserName"),
                                    style: TextStyle(color: Colors.grey,fontSize: appSize.width*0.039,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),


                                ],
                              ),
                            ),
                            SizedBox(height: appSize.height*0.01,),
                            Divider(
                              color: Colors.grey,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: appSize.width*0.02,right: appSize.width*0.02,top: appSize.height*0.01 ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Phone.no",style: TextStyle(color: Colors.grey,fontSize: appSize.width*0.039,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                                  Text(ds.get("phoneNumber"),style: TextStyle(color: Colors.grey,
                                      fontSize: appSize.width*0.039,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),


                                ],
                              ),
                            ),
                            SizedBox(height: appSize.height*0.01,),
                            Divider(
                              color: Colors.grey,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: appSize.width*0.02,right: appSize.width*0.02,top: appSize.height*0.01 ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Email",style: TextStyle(color: Colors.grey,fontSize: appSize.width*0.039,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                                  Text(ds.get("Email"),style: TextStyle(color: Colors.grey,
                                      fontSize: appSize.width*0.039,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),


                                ],
                              ),
                            ),
                            SizedBox(height: appSize.height*0.01,),
                            Divider(
                              color: Colors.grey,
                            ),




                          ],);
                        }
                        else if (snapshot.hasError) {
                          return Center(child: const Icon(Icons.error_outline));
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ),
                SizedBox(height: appSize.height*0.01,),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(top: appSize.height*0.00,left: appSize.width*0.02),
                  child: Text("MORE INFORMATION",style: TextStyle(color: Colors.black,fontSize: appSize.width*0.039,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                ),
                SizedBox(height: appSize.height*0.01,),
                Divider(
                  color: Colors.grey,
                ),

                Padding(
                  padding:  EdgeInsets.only(left: appSize.width*0.02,right: appSize.width*0.02,top: appSize.height*0.01 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Privacy Policy",style: TextStyle(color: Colors.grey,fontSize: appSize.width*0.039,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                      Icon(Icons.arrow_forward_ios,color: Colors.grey,size: appSize.height*0.03,

                      )

                    ],
                  ),
                ),
                SizedBox(height: appSize.height*0.01,),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: appSize.width*0.02,right: appSize.width*0.02,top: appSize.height*0.01 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Terms & Conditions",style: TextStyle(color: Colors.grey,fontSize: appSize.width*0.039,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                      Icon(Icons.arrow_forward_ios,color: Colors.grey,size: appSize.height*0.03,

                      )

                    ],
                  ),
                ),
                SizedBox(height: appSize.height*0.01,),
                Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: ()async{
                    await firebaseAuth.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginScreen ()),
                            (Route<dynamic> route) => false);
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(left: appSize.width*0.02,right: appSize.width*0.02,top: appSize.height*0.01 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Logout",style: TextStyle(color: Colors.grey,fontSize: appSize.width*0.039,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                        Icon(Icons.arrow_forward_ios,color: Colors.grey,size: appSize.height*0.03,

                        )

                      ],
                    ),
                  ),
                ),
                SizedBox(height: appSize.height*0.02,),



              ],
            )
        ),
      ),
    );
  }
}
