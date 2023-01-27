import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopperapp/Widgets/mytextfield.dart';

import '../../utills/colors.dart';
class NewGroupScreen extends StatefulWidget {
  const NewGroupScreen({Key? key}) : super(key: key);

  @override
  _NewGroupScreenState createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  String dropdownvalue = 'Select Users';

  // List of items in our dropdown menu
  var items = [
    'Select Users',
    'Zohaib',
    'Umer',
    'Yasir'
  ];
  bool isLoading=false;
  File? imageUrl;
  String? imageLink;
  final ImagePicker _picker = ImagePicker();
  void getImage()async{
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageUrl=File(image!.path) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: themeColor,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 25,)),
        centerTitle: true,
        title: Text("Add New Group",style: TextStyle(
            color: Colors.white
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: (){

                },
                child: Icon(Icons.add,color: Colors.white,size: 27,)),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left: appSize.width*0.07,right: appSize.width*0.07),
          child: Column(

            children: [
              SizedBox(height: appSize.height*0.03,),
              Center(
                child: InkWell(
                  onTap: getImage,
                  child: Container(
                    height: appSize.height*0.12,
                    width: appSize.width*.22,
                    decoration:BoxDecoration(

                        color: lightColor,

                        shape: BoxShape.circle) ,
                    child:imageUrl==null? Icon(Icons.camera_alt_outlined,color: Colors.grey,size: 28 ,):Container(
                      height: appSize.height*0.12,
                      width: appSize.width*.22,
                      decoration:BoxDecoration(
                          image: DecorationImage(image: FileImage(imageUrl!),fit: BoxFit.fill),
                          color: Color(0xffF5F5F4),

                          shape: BoxShape.circle) ,),
                  ),
                ),
              ),
              SizedBox(height: appSize.height*0.04,),

              MyTextField(show: false,
                hintText: "Enter group name",

              ),
              SizedBox(height: appSize.height*0.02,),
              MyTextField(
                hintText: "created by @username",
                show: false,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter email";
                  }
                  // String pattern =
                  //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  // RegExp regex = new RegExp(pattern);
                  // if (!regex.hasMatch(value)) {
                  //   return '*Email format is invalid';
                  // } else {
                  //   return null;
                  // }
                },


              ),
              SizedBox(height: appSize.height*0.02,),

              Container(
                alignment: Alignment.center,
                height: appSize.height*0.07,
                width: appSize.width,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black,width: 1 ),


                ),
                child:  DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    // Initial Value
                    value: dropdownvalue,


                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),

                    // Array list of items
                    items: items
                        .map((items) => DropdownMenuItem(
                      value: items.toString(),
                      child: Text(
                        items.toString(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ))
                        .toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (newValue) {
                      setState(() {
                       dropdownvalue = newValue.toString();
                        print(dropdownvalue);
                      });
                    },
                  ),
                ),
              ),
              Container(
                height: 54,

                margin: EdgeInsets.only(


                    top: appSize.height * 0.36,

                ),
                width: appSize.width*0.86,
                child: MaterialButton(
                  child: Text(
                    "Create New Group" ,
                    style: TextStyle(fontFamily:  'PTSans',
                        fontSize: appSize.width*0.042,
                        color: Colors.white,
                        fontWeight: FontWeight.w500

                    ),

                  ),
                  onPressed: () async {



                  },
                  color: themeColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
