import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopperapp/auth/login_screen.dart';
import 'package:shopperapp/utills/authutils.dart';
import 'package:shopperapp/utills/colors.dart';
import 'package:shopperapp/widgets/customdialog.dart';
import 'package:shopperapp/widgets/myappbar.dart';
import 'package:shopperapp/widgets/mytext.dart';
import 'package:shopperapp/widgets/mytextfield.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState>key=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController userController=TextEditingController();
  int selected=0;

  File? imageUrl;
  String? imageLink;
  final ImagePicker _picker = ImagePicker();
  void getImage()async{
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageUrl=File(image!.path) ;
    });
  }



  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]);
  final numValidator=MultiValidator([
    RequiredValidator(errorText: 'password is required'),

  ]);


  void clickfunction(int i) {
    if (i == 0) {
      setState(() {
        selected == 1 ? selected = 0 : selected = 1;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var appSize=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                MyAppbar(
                  title: "Sign up",
                ),
                Padding(
                  padding:  EdgeInsets.only(left: appSize.width*0.04,right:appSize.width*0.04 ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child:Image.asset("assets/images/applogo.png",scale: 12,)
                      ),



                      Container(
                        width: appSize.width,
                        padding: EdgeInsets.only(left: appSize.width*0.04,right: appSize.width*0.04,top: appSize.height*0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)

                        ),
                        child: Column(
                          children: [
                            InkWell(
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
                            SizedBox(height: appSize.height*0.02,),
                            MyTextField(show: false,
                              hintText: "Username",
                              controller: userController,
                              validator:   RequiredValidator(errorText: 'Username is required') ,


                            ),
                            SizedBox(height: appSize.height*0.017,),
                            MyTextField(
                             hintText: "Email",
                              show: false,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Please enter email";
                                }
                                String pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(value)) {
                                  return '*Email format is invalid';
                                } else {
                                  return null;
                                }
                              },

                              controller: emailController,
                            ),


                            SizedBox(height: appSize.height*0.017,),
                            MyTextField(show: false,


                              validator:   RequiredValidator(errorText: 'Phone no. is required') ,

                              controller: phoneController,
                              hintText: "Phone no.",



                            ),
                            SizedBox(height: appSize.height*0.017,),
                            MyTextField(

                              show: true,
                              validator:   passwordValidator,

                              controller: passwordController,
                              hintText: "Password",
                              eye: true,



                            ),
                            SizedBox(height: appSize.height*0.03,),

                            Row(
                              children: [
                                SizedBox(width: appSize.width*0.01,),
                                GestureDetector(
                                  onTap: (){
                                    clickfunction(0);
                                  },
                                  child: Container(
                                    height: 23,
                                    width: 23,

                                    padding: EdgeInsets.all(1),

                                    decoration: BoxDecoration(
                                        color: selected==0?Colors.white:themeColor,
                                        borderRadius: BorderRadius.circular(4),

                                        border: Border.all(

                                            color: selected==0?themeColor:themeColor,

                                            width: 1.5)

                                    ),
                                    child: Icon(Icons.check,color: Colors.white,size: 20,),
                                  ),
                                ),
                                SizedBox(width: appSize.width*0.015,),
                                Padding(
                                  padding:  EdgeInsets.only(left: appSize.width*0.01),
                                  child: MyText(text: "By creating an account you agree to \nour Terms of Service and Privacy Policy",color: Colors.black,fontSize: appSize.width*0.035,),
                                ),



                              ],
                            ),
                            Container(
                              height: 54,

                              margin: EdgeInsets.only(


                                  top: appSize.height * 0.035,
                                  bottom: appSize.height*0.035
                              ),
                              width: appSize.width*0.8,
                              child: MaterialButton(
                                child: Text(
                                  "Send" ,
                                  style: TextStyle(fontFamily:  'PTSans',
                                      fontSize: appSize.width*0.042,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500

                                  ),

                                ),
                                onPressed: () async {
                                  if(imageUrl==null){
                                    Customdialog().showInSnackBar("Please add image", context) ;                   }
                                  else {
                                    if(key.currentState!.validate()){
                                      Customdialog.showDialogBox(context);
                                      uploadImageToFirebase().then((value) =>
                                          AuthUtils().registerUser(
                                              imageLink!,
                                              userController.text.trim(),
                                              emailController.text.trim(),
                                              phoneController.text.trim(),
                                              passwordController.text.trim(),

                                              context)
                                      );}

                                  }


                                },
                                color: themeColor,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(width: appSize.width*0.06,),

                                SizedBox(width: appSize.width*0.08,),
                                MyText(text: "Already have an account?",color: Colors.black,fontSize: appSize.width*0.037,),
                                SizedBox(width: appSize.width*0.017,),
                                GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => LoginScreen()),
                                      );
                                    },
                                    child: MyText(text: "Sign in",color: themeColor,fontSize: appSize.width*0.039,fontWeight: FontWeight.w700,)),

                              ],
                            ),
                            SizedBox(height: appSize.height*0.017,),

                          ],
                        ),
                      )
                    ],),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
  Future uploadImageToFirebase() async {
    File? fileName = imageUrl;
    var uuid = Uuid();
    firebase_storage.Reference firebaseStorageRef = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('userProfile/images+${uuid.v4()}');
    firebase_storage.UploadTask uploadTask =
    firebaseStorageRef.putFile(fileName!);
    firebase_storage.TaskSnapshot taskSnapshot =
    await uploadTask.whenComplete(() async {
      print(fileName);
      String img = await uploadTask.snapshot.ref.getDownloadURL();
      setState(() {
        imageLink = img;
      });
    });
  }
  searchName(String name) {
    List<String> caseSearchList = [];
    String temp = "";
    for (int i = 0; i < name.length; i++) {
      temp = temp + name[i].toLowerCase();
      caseSearchList.add(temp);
    }
    return caseSearchList;
  }
}
