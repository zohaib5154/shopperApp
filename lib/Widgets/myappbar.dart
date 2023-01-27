import 'package:flutter/material.dart';


import 'mytext.dart';

class MyAppbar extends StatelessWidget {
  bool? centerTitle;
  bool? automaticallyImplyLeading;
  String title;
  MyAppbar({Key? key,this.automaticallyImplyLeading,this.centerTitle,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Size=MediaQuery.of(context).size;
    return AppBar(
      centerTitle: centerTitle??true,
      automaticallyImplyLeading: automaticallyImplyLeading??false,
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,size: 27,)),

      title: MyText(text: title,fontSize: Size.height*0.028,
        fontWeight: FontWeight.w900,
      ),
    ) ;
  }
}
