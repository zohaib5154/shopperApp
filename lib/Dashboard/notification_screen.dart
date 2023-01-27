import 'package:flutter/material.dart';
import 'package:shopperapp/Utills/colors.dart';
import 'package:shopperapp/Widgets/mytext.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var appSize=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications",style: TextStyle(
            color: Colors.white
        ),),
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },

            child: Icon(Icons.arrow_back_ios,color: Colors.white,)),

        backgroundColor: themeColor,

      ),
      backgroundColor: Colors.white,
      body: SafeArea(

        child: Padding(
          padding: EdgeInsets.only(left: appSize.width*0.05,right: appSize.width*0.05,top: appSize.height*0.02),
          child: Column(
            children: [

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
                          MyText(text: "Hassan Ali",fontWeight: FontWeight.w500,fontSize: appSize.width*0.038,),

                        ],
                      ),
                      Row(

                        children: [
                          Icon(Icons.check_circle,size: 40,color: themeColor,),
                          SizedBox(width: appSize.width*0.02,),
                          Icon(Icons.cancel,size: 40,color: Colors.red,)
                        ],
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
