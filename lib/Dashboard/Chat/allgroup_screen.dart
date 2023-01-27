
import 'package:flutter/material.dart';
import 'package:shopperapp/Dashboard/Chat/chatscreen.dart';
import 'package:shopperapp/Dashboard/Chat/newgroup_screen.dart';
import 'package:shopperapp/Dashboard/Chat/updategroup_screen.dart';
import 'package:shopperapp/Utills/colors.dart';
import 'package:shopperapp/Widgets/mytext.dart';
import 'package:shopperapp/Widgets/mytextfield.dart';
class AllGroupScreen extends StatefulWidget {
  const AllGroupScreen({Key? key}) : super(key: key);

  @override
  _AllGroupScreenState createState() => _AllGroupScreenState();
}

class _AllGroupScreenState extends State<AllGroupScreen> {
  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: themeColor,
        leading: Icon(Icons.menu,color: Colors.white,size: 25,),
        centerTitle: true,
        title: Text("All Groups",style: TextStyle(
            color: Colors.white
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewGroupScreen()),
                  );
                },
                child: Icon(Icons.add,color: Colors.white,size: 27,)),
          )
        ],
      ),
      body: SafeArea(

        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: appSize.width*0.05,right: appSize.width*0.05,top: appSize.height*0.02),
            child: Column(
              children: [
                MyTextField(

                  show: false,



                  hintText: "Search",),
                SizedBox(height: appSize.height*0.02,),

                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Container(
                      height: appSize.height*0.09,
                      width: appSize.width,
                      padding: EdgeInsets.only(left: appSize.width*0.02,right: appSize.width*0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage("assets/images/dp.jpg"),
                              ),
                              SizedBox(width: appSize.width*0.02,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  SizedBox(height: 13,),
                                  MyText(text: "Reonlogics Group",fontWeight: FontWeight.w500,fontSize: appSize.width*0.04,),
                                  SizedBox(height: 2,),

                                  MyText(text: "Created by @username",fontWeight: FontWeight.w400,fontSize: appSize.width*0.032,),
                                ],
                              )
                            ],
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => UpdateGroupScreen()),
                                );
                              },

                              child: Icon(Icons.edit,color: Colors.black,size: 26,))


                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        ,
      ),
    );
  }
}
