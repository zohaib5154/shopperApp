import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopperapp/Utills/colors.dart';
import 'package:shopperapp/Utills/constants.dart';
import 'package:shopperapp/Widgets/mytextfield.dart';



class UserUpdateScreen extends StatefulWidget {
String username;
String id;


String phone;

  UserUpdateScreen({Key? key,required this.id,required this.username,required this.phone,}) : super(key: key);

  @override
  State<UserUpdateScreen> createState() => _UserUpdateScreenState();
}

class _UserUpdateScreenState extends State<UserUpdateScreen> {
  final GlobalKey<FormState>key=GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();

  TextEditingController phoneController=TextEditingController();


  File? imageUrl;
  String? imageLink;

  final ImagePicker _picker = ImagePicker();
  void addImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageUrl = File(image!.path);
    });
  }
  void initState() {
    // TODO: implement initState
    super.initState();
   nameController = widget.username != null && widget.username.isNotEmpty
        ? TextEditingController(text: widget.username)
        : TextEditingController();


    phoneController = widget.phone!= null && widget.phone.isNotEmpty
        ? TextEditingController(text: widget.phone)
        : TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    var appSize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeColor,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);

            },
            child: Icon(Icons.arrow_back_ios,color: Colors.white)),
        title: Text("User Update",style: TextStyle(
          color: Colors.white,



        ),),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: appSize.width*0.05,right: appSize.width*0.05),
          child: Column(
            children: [
              SizedBox(height: appSize.height * 0.06),
              MyTextField(
                validator: RequiredValidator(errorText: "Required"),
                controller: nameController,
                hintText: "Username", show: false,
              ),


              SizedBox(height: appSize.height * 0.03),
              MyTextField(
                validator: RequiredValidator(errorText: "Required"),
                controller: phoneController,
                hintText: "Phone no.", show: false,
              ),

              InkWell(
                onTap: () async {

                  await firebaseFirestore.collection("users").doc(widget.id).update({
                    "UserName":nameController.text,
                    "phoneNumber":phoneController.text,
                  }).then((value) => {
                    Navigator.pop(context),
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: appSize.height * 0.04),
                  height: appSize.height * 0.07,
                  width: appSize.width * 0.6,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: appSize.width * 0.045),
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
