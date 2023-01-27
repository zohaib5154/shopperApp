import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shopperapp/auth/signupscreen.dart';
import 'package:shopperapp/utills/authutils.dart';
import 'package:shopperapp/utills/colors.dart';
import 'package:shopperapp/widgets/mytext.dart';
import 'package:shopperapp/widgets/mytextfield.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final formKey=GlobalKey<FormState>();
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]);
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
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding:  EdgeInsets.only(top: appSize.height*0.03,left: appSize.width*0.04,right: appSize.width*0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    CircleAvatar(
                      radius: 55,
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                     backgroundImage: AssetImage("assets/images/applogo.png",


                      )
                    ),
                    SizedBox(height: appSize.height*0.02,),
                    Container(

                      width: appSize.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            MyText(
                              text: "Login",
                              color: Colors.black,
                              fontSize: appSize.width*0.052,
                              fontWeight: FontWeight.w700,


                            ),
                            SizedBox(height: appSize.height*0.06,),


                            MyTextField(

                              show: false,
                              validator:   RequiredValidator(errorText: 'Email is required') ,

                              controller: emailController,
                              hintText: "Email",),
                            SizedBox(
                              height:   appSize.height*0.02,
                            ),
                            MyTextField(
                              show: true,
                              validator: passwordValidator,
                              controller: passwordController,
                              hintText: "Password",

                              eye: true,
                            ),
                            SizedBox(height: appSize.height*0.02,),

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
                                MyText(text: "Remember me",color: Colors.black,fontSize: appSize.width*0.037,),
                                SizedBox(width: appSize.width*0.16,),
                                GestureDetector(
                                    onTap: (){

                                    },
                                    child: MyText(text: "Forget Password?",color: themeColor,fontSize: appSize.width*0.037,)),

                              ],
                            ),
                            Container(
                              height: 54,

                              margin: EdgeInsets.only(
                                  top: appSize.height * 0.03,
                                  bottom: appSize.height*0.025
                              ),
                              width: appSize.width*0.8,
                              child: MaterialButton(
                                child: Text(
                                  "Sign in" ,
                                  style: TextStyle(
                                      fontFamily:  'PTSans',
                                      fontSize: appSize.width*0.042,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500

                                  ),

                                ),
                                onPressed: () async {
                                  if(formKey.currentState!.validate()){

                                    AuthUtils().loginUser(emailController.text.trim(), passwordController.text.trim(), context);

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
                                SizedBox(width: appSize.width*0.1,),

                                SizedBox(width: appSize.width*0.01,),
                                MyText(text: "Dont have not an account?",color: Colors.black,fontSize: appSize.width*0.037,),
                                SizedBox(width: appSize.width*0.02,),
                                GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SignupScreen()),
                                      );
                                    },
                                    child: MyText(text: "Sign up",color: themeColor,fontSize: appSize.width*0.039,fontWeight: FontWeight.w700,)),

                              ],
                            ),
                            SizedBox(height: appSize.height*0.01,),
                            MyText(text: "OR",color: Colors.black,fontSize: appSize.width*0.037,fontWeight: FontWeight.bold,),

                            Container(
                              height: 54,

                              margin: EdgeInsets.only(


                                  top: appSize.height * 0.02,
                                  bottom: appSize.height*0.025
                              ),
                              width: appSize.width*0.8,
                              child: MaterialButton(
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/images/Facebook.svg"),
                                    SizedBox(width: appSize.width*0.03,),
                                    Text(
                                      "Facebook" ,
                                      style: TextStyle(
                                          fontFamily:  'PTSans',
                                          fontSize: appSize.width*0.042,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500

                                      ),

                                    ),
                                  ],
                                ),
                                onPressed: () async {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => BottombarScreen()),
                                  // );

                                },
                                color: Color(0xff38529A),
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Container(
                              height: 54,

                              margin: EdgeInsets.only(


                                  top: appSize.height * 0.0,

                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: appSize.width*0.8,
                              child: MaterialButton(
                                child: Row(
                                  children: [

                                    SvgPicture.asset("assets/images/google.svg"),
                                    SizedBox(width: appSize.width*0.03,),
                                    Text(
                                      "Google" ,
                                      style: TextStyle(
                                          fontFamily:  'PTSans',
                                          fontSize: appSize.width*0.042,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500

                                      ),

                                    ),
                                  ],
                                ),
                                onPressed: () async {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => BottombarScreen()),
                                  // );

                                },
                                color: Colors.white,
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

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
