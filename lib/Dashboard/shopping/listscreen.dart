

import 'package:flutter/material.dart';
import 'package:shopperapp/Dashboard/shopping/itemscreen.dart';
import 'package:shopperapp/Utills/colors.dart';
import 'package:shopperapp/Widgets/mytext.dart';
class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<String> listname = <String>[
    'List Name 1',
    'List Name 2',
    'List Name 3',
    'List Name 4',
    'List Name 5',
    'List Name 6',
    'List Name 7',
    'List Name 8',
    'List Name 9',
    'List Name 10',
    'List Name 11',
    'List Name 12',

  ];
  @override
  Widget build(BuildContext context) {
    var appSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
backgroundColor: themeColor,
        title: Text("Lists"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left: appSize.width*0.05,right: appSize.width*0.05),
          child: SingleChildScrollView(
            child: Column(

              children: [

                SizedBox(height: appSize.height*0.02,),
                Container(

                  height: appSize.height*0.9,
                  width: appSize.width,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 14,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ItemScreen()),
                              );
                            },
                            child:Column(
                              children: [

                                Card(
                                  elevation: 2,
                                  child:   Container(
                                    height: appSize.height*0.07,
                                    width: appSize.width*0.87,
                                    padding: EdgeInsets.only(left: appSize.width*0.025,top: appSize.height*0.012),
                                    decoration: BoxDecoration(
                                        color: Colors.white
                                    ),
                                    child:   Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MyText(text: "List name",fontSize: appSize.width*0.04,fontWeight: FontWeight.w500,),
                                        MyText(text: "List belong to Reonlogics group",fontSize: appSize.width*0.032,fontWeight: FontWeight.w400,),
                                      ],
                                    )
                                  ),
                                ),
                                SizedBox(height: appSize.height*0.01,)
                              ],
                            )


                        );
                      }),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
