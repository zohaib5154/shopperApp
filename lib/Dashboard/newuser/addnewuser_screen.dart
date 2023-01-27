import 'package:flutter/material.dart';
import 'package:shopperapp/Dashboard/notification_screen.dart';
import 'package:shopperapp/Utills/colors.dart';
import 'package:shopperapp/Widgets/mytext.dart';
import 'package:shopperapp/Widgets/mytextfield.dart';
class NewUserInviteScreen extends StatefulWidget {
  const NewUserInviteScreen({Key? key}) : super(key: key);

  @override
  _NewUserInviteScreenState createState() => _NewUserInviteScreenState();
}

class _NewUserInviteScreenState extends State<NewUserInviteScreen> {
  bool isPerson=false;
  int selected=0;
  void clickfunction(int i){
    if(i==0){

      setState(() {
        selected==1?selected=0:selected=1;
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    var appSize=MediaQuery.of(context).size;

    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add new User",style: TextStyle(
            color: Colors.white
        ),),
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },

            child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationScreen()),
                  );
                },
                child: Icon(Icons.notifications_on,color: Colors.white,size: 27,)),
          )
        ],
        backgroundColor: themeColor,

      ),
      body: SafeArea(

        child: Padding(
          padding: EdgeInsets.only(left: appSize.width*0.05,right: appSize.width*0.05,top: appSize.height*0.02),
          child: Column(
            children: [
              MyTextField(

                show: false,



                hintText: "Search",),
              SizedBox(height: appSize.height*0.02,),

              Card(
                elevation: 4,
                child: Container(
                  height: appSize.height*0.085,
                  width: appSize.width,
padding: EdgeInsets.only(left: appSize.width*0.02,right: appSize.width*0.02),
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
Row(
  children: [
    CircleAvatar(
      radius: 27,
      backgroundImage: AssetImage("assets/images/dp.jpg"),
    ),
    SizedBox(width: appSize.width*0.02,),
    MyText(text: "Muhammad Zohaib",fontWeight: FontWeight.w500,fontSize: appSize.width*0.038,)
  ],
),

    GestureDetector(
        onTap: (){
          clickfunction(0);
        },
        child:  selected==0?Icon(Icons.person_add_alt_1_rounded,color: Colors.black,size: 27,):
        Icon(Icons.person_remove,color: Colors.red,size: 27,)
    )
  ],
),
                ),
              ),
            ],
          ),
        )
        ,
      ),
    );
  }
}
