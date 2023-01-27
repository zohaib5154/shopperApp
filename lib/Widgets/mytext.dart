import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  String text;
  Color? color;
  FontWeight? fontWeight;
  double? fontSize;
   MyText({Key? key,required this.text,this.fontWeight,this.color,this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text( text,style:
        TextStyle(
color: color??Colors.black,
          fontWeight: fontWeight,
          fontSize: fontSize
        )
        ,softWrap: true,
      overflow: TextOverflow.fade,
    );
  }
}
