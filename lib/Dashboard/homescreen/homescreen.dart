import 'package:flutter/material.dart';
import 'package:shopperapp/Widgets/mytext.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var appSize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: appSize.height*0.02,left: appSize.width*0.05,right: appSize.width*0.05),
          child: Form(
            key: formKey,
            child: Column(
              children: [


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height:appSize.height*0.05,
                      width: appSize.width*0.2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black,width: 1.4)
                      ),
                      child: MyText(
                        text: "Reset",
                      ),
                    ),

                    Icon(Icons.filter_list_outlined,color: Colors.black,size: 27,),

                  ],
                ),
                SizedBox(height: appSize.height*0.04),
                Container(
                    height: appSize.height*0.25,
                    width: appSize.width*0.9,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.black,width: 1.4)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 7,left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(


                                decoration: BoxDecoration(

                                ),
                                child: MyText(
                                  text: "Mango",
                                ),
                              ),
                              Container(
                                height:appSize.height*0.038,
                                width: appSize.width*0.13,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black,width: 1.4)
                                ),
                                child: MyText(
                                  text: "Add",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 7,left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(


                                decoration: BoxDecoration(

                                ),
                                child: MyText(
                                  text: "Potato",
                                ),
                              ),
                              Container(
                                height:appSize.height*0.038,
                                width: appSize.width*0.13,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black,width: 1.4)
                                ),
                                child: MyText(
                                  text: "Add",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 7,left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(


                                decoration: BoxDecoration(

                                ),
                                child: MyText(
                                  text: "Apple",
                                ),
                              ),
                              Container(
                                height:appSize.height*0.038,
                                width: appSize.width*0.13,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black,width: 1.4)
                                ),
                                child: MyText(
                                  text: "Add",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 13,left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(


                        decoration: BoxDecoration(

                        ),
                        child: MyText(
                          text: "Potato",
                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            height:appSize.height*0.03,
                            width: appSize.width*0.07,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: Colors.black,width: 1.4)
                            ),
                            child: MyText(
                              text: "-",
                              fontSize: appSize.width*0.042,
                            ),
                          ),
                          SizedBox(width: appSize.width*0.03,),
                          MyText(
                            text: "2",
                            fontSize: appSize.width*0.048,
                          ),
                          SizedBox(width: appSize.width*0.03,),

                          Container(
                              height:appSize.height*0.03,
                              width: appSize.width*0.07,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black,width: 1.4)
                              ),
                              child:Icon(Icons.add,color: Colors.black,size: 16,)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: appSize.height*0.015),
                Padding(
                  padding:  EdgeInsets.only(top: 3,left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(


                        decoration: BoxDecoration(

                        ),
                        child: MyText(
                          text: "Apple",
                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            height:appSize.height*0.03,
                            width: appSize.width*0.07,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: Colors.black,width: 1.4)
                            ),
                            child: MyText(
                              text: "-",
                              fontSize: appSize.width*0.042,
                            ),
                          ),
                          SizedBox(width: appSize.width*0.03,),
                          MyText(
                            text: "1",
                            fontSize: appSize.width*0.048,
                          ),
                          SizedBox(width: appSize.width*0.03,),

                          Container(
                              height:appSize.height*0.03,
                              width: appSize.width*0.07,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black,width: 1.4)
                              ),
                              child:Icon(Icons.add,color: Colors.black,size: 16,)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: appSize.height*0.04),

                SizedBox(height: appSize.height*0.02),

                TextFormField(

                  keyboardType: TextInputType.number,

                  maxLines: 1,


                  style:  TextStyle(
                    color:Colors.black,
                    fontSize: appSize.height*0.018,),

                  //     controller: _email,
                  decoration: InputDecoration(
                    hintText: 'Weekly Budget',hintStyle:TextStyle(
                    color:Colors.grey,
                    fontSize: appSize.height*0.018,),

                    border: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.black,width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.black,width: 1),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.black ,width: 1),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),




                ),
                SizedBox(height: appSize.height*0.065),
                Container(
                  height:appSize.height*0.068,
                  width: appSize.width*0.9,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black,width: 1.4)
                  ),
                  child: MyText(
                    text: "Reset",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
