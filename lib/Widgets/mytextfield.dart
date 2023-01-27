import 'package:flutter/material.dart';


class MyTextField extends StatefulWidget {
  String? hintText;
  bool? eye;
  int? maxLines;
bool show;
Icon? icon;
  TextEditingController? controller;
  String? Function(String?)? validator;
   MyTextField({Key? key,required this.show,this.maxLines,this.hintText,this.eye,this.controller, this.validator,  this.icon}) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {


  @override
  Widget build(BuildContext context) {
    var appSize=MediaQuery.of(context).size;

    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.show,




      decoration: InputDecoration(
        fillColor:Colors.white,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey),

        border: OutlineInputBorder(
          borderSide: BorderSide(color:Colors.black,width: 1),
          borderRadius: BorderRadius.circular(7.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.black,width: 1),
            borderRadius: BorderRadius.circular(7.0)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.black,width: 1),
            borderRadius: BorderRadius.circular(7.0)
        ),
          hintText: widget.hintText??"",
         prefixIcon: widget.icon,
          suffixIcon: widget.eye==null?null:IconButton(onPressed: (){
            setState(() {
              widget.show=!widget.show;
            });
          },icon:widget.show? Icon(Icons.visibility,color:Colors.grey,):Icon(
            Icons.visibility_off
            ,color:Colors.grey,),)
      ),

    );
  }
}
