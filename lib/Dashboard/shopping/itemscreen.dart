
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopperapp/Dashboard/shopping/mapscreen.dart';
import 'package:shopperapp/Dashboard/shopping/qrcode_screen.dart';
import 'package:shopperapp/Utills/colors.dart';
import 'package:shopperapp/Utills/helper.dart';
import 'package:shopperapp/Widgets/mytext.dart';
class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  bool value = false;
  int selected=0;
  int selected2=0;
  void clickfunction(int i){
    if(i==0){

      setState(() {
        selected==1?selected=0:selected=1;
      });
    }

  }
  void clickfunction2(int i){
    if(i==0){

      setState(() {
        selected2==1?selected2=0:selected2=1;
      });
    }

  }
  int selected3=0;
  void clickfunction3(int i){
    if(i==0){

      setState(() {
        selected3==1?selected3=0:selected3=1;
      });
    }

  }
  int selected4=0;
  void clickfunction4(int i){
    if(i==0){

      setState(() {
        selected4==1?selected4=0:selected4=1;
      });
    }
  }
  void showModal(){
    var appSize=MediaQuery.of(context).size;
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            height:appSize.height*0.8,
            color: Color(0xff737373),

            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50)),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15,),



                ],
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    var appSize=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.white,)),

        backgroundColor: themeColor,
        title: Text("List Items"),
      ),
      backgroundColor: Colors.white,
body: SafeArea(
  child: Column(
    children: [
      SizedBox(height: appSize.height*0.02,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyText(text: "Total Budget 20\$ \nRemaining: 5\$",
          fontWeight: FontWeight.w600,
            fontSize: appSize.width*0.04,
          ),
          Column(

            children: [
              GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40.0), ),
                        ),
                        isScrollControlled: true,
                        isDismissible: true,
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                            child: Container(

                              height: Helper.getScreenHeight(context) * 0.85,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset("assets/images/fb.png",scale: 16,),
                                        SvgPicture.asset("assets/images/insta.svg",color: Colors.black,height: 29,),
                                        Image.asset("assets/images/twitter.png",scale: 16,),

                                        Image.asset("assets/images/linkedin.png",scale: 16,),

                                        Image.asset("assets/images/whatsapp.png",scale: 19,),
                                        Image.asset("assets/images/youtube.png",scale: 18,),
                                        Image.asset("assets/images/send.png",scale: 19,),




                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: appSize.height*0.015,
                                  ),
                                  Container(
                                    height: appSize.height*0.7815,
                                    width: appSize.width,
                                    decoration: BoxDecoration(
color: Color(0xffD0B502),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40.0), ),

                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.only(left: appSize.width*0.04,top: appSize.height*0.02),
                                            child: MyText(text: "Pedidos & Ofertas",color: Colors.white,fontWeight: FontWeight.w800,fontSize: appSize.width*0.044,),
                                          ),

                                          Padding(
                                            padding:  EdgeInsets.only(left: appSize.width*0.04,top: appSize.height*0.01,bottom: appSize.height*0.015),
                                            child: MyText(text: "Un producto cien por ciento natural, \nnutritivo, con sabor único e inigualable \nelaborado con el máximo cuidado y \nprofesionalidad para su pleno disfrute",
                                              color: Colors.white,fontWeight: FontWeight.w400,fontSize: appSize.width*0.044,),
                                          ),
                                          Center(child: Image.asset("assets/images/applogo2.png",scale: 5,)),
                                          SizedBox(height: appSize.height*0.012,),
                                          Center(
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: appSize.height*0.064,
                                              width: appSize.width*0.5,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(30.0)
                                              ),
                                              child: MyText(text: "Pedidos Online",color: Colors.white,fontWeight: FontWeight.w500,fontSize: appSize.width*0.048,),

                                            ),
                                          ),
                                          SizedBox(height: appSize.height*0.012,),
                                          SizedBox(
                                            height: appSize.height*0.3,
                                            width: appSize.width,
                                            child: GoogleMap(
                                              mapType: MapType.normal,
                                              myLocationEnabled: true,
                                              myLocationButtonEnabled: true,
                                              mapToolbarEnabled: true,
                                              zoomGesturesEnabled: true,
                                              zoomControlsEnabled: true,
                                              rotateGesturesEnabled: true,
                                              minMaxZoomPreference: MinMaxZoomPreference(6, 19),
                                              initialCameraPosition: CameraPosition(
                                                zoom: 12,
                                                target: LatLng(-0.103539, -78.492666),

                                              ),

                                            ),
                                          ),

                                          Container(
                                            color: Colors.white,
                                            width: appSize.width,
                                            child: Padding(
                                              padding:  EdgeInsets.only(left: appSize.width*0.04,top: appSize.height*0.02),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  MyText(text: "Contacto",color: Colors.black,fontWeight: FontWeight.w700,fontSize: appSize.width*0.044,),
                                                  SizedBox(height: appSize.height*0.01,),

                                                  MyText(text: " Yo Con Yuca Te Alimenta Bien!",color: Colors.black,fontWeight: FontWeight.w400,fontSize: appSize.width*0.04,),

                                                  SizedBox(height: appSize.height*0.02,),
                                                  Row(
                                                    children: [
                                                      MyText(text: "Calle Nogales",color: Colors.black,fontWeight: FontWeight.w400,fontSize: appSize.width*0.038,),
                                                      SizedBox(width: appSize.width*0.1,),
                                                      MyText(text: "Facebook",color: Colors.black,fontWeight: FontWeight.w400,fontSize: appSize.width*0.038,),

                                                    ],
                                                  ),
                                                  SizedBox(height: appSize.height*0.008,),

                                                  Row(
                                                    children: [
                                                      MyText(text: "Oe4-143",color: Colors.black,fontWeight: FontWeight.w400,fontSize: appSize.width*0.038,),
                                                      SizedBox(width: appSize.width*0.2,),
                                                      MyText(text: "Twitter ",color: Colors.black,fontWeight: FontWeight.w400,fontSize: appSize.width*0.038,),

                                                    ],
                                                  ),
                                                  SizedBox(height: appSize.height*0.008,),
                                                  Row(
                                                    children: [
                                                      MyText(text: "y Piedras Negras",color: Colors.black,fontWeight: FontWeight.w400,fontSize: appSize.width*0.038,),
                                                      SizedBox(width: appSize.width*0.05,),
                                                      MyText(text: "Instagram ",color: Colors.black,fontWeight: FontWeight.w400,fontSize: appSize.width*0.038,),

                                                    ],
                                                  ),
                                                  SizedBox(height: appSize.height*0.008,),
                                                  Row(
                                                    children: [
                                                      MyText(text: "Pichincha/Quito/",color: Colors.black,fontWeight: FontWeight.w400,fontSize: appSize.width*0.038,),
                                                      SizedBox(width: appSize.width*0.04,),
                                                      MyText(text: "Tiktok",color: Colors.black,fontWeight: FontWeight.w400,fontSize: appSize.width*0.038,),

                                                    ],
                                                  ),
                                                  SizedBox(height: appSize.height*0.008,),
                                                  Row(
                                                    children: [
                                                      MyText(text: "Ponceano/N71G",color: Colors.black,fontWeight: FontWeight.w400,fontSize: appSize.width*0.038,),
                                                      SizedBox(width: appSize.width*0.05,),
                                                      MyText(text: "Whattsappk Ecuador",color: Colors.black,fontWeight: FontWeight.w400,fontSize: appSize.width*0.038,),

                                                    ],
                                                  ),
                                                  SizedBox(height: appSize.height*0.05,),
                                                  Row(
                                                    children: [
                                                      MyText(text: "+593-969404021",color: Colors.black,fontWeight: FontWeight.w400,fontSize: appSize.width*0.038,),
                                                      SizedBox(width: appSize.width*0.05,),
                                                      MyText(text: "yoconyuca@gmail.com",color: Colors.black,fontWeight: FontWeight.w400,fontSize: appSize.width*0.038,),

                                                    ],
                                                  ),
                                                  SizedBox(height: appSize.height*0.025,),


                                                ],
                                              ),
                                            ),
                                          ),


                                          Container(
                                            height: appSize.height*0.048,
                                            width: appSize.width,
                                            alignment: Alignment.center,
                                            color:Color(0xffD0B502) ,
                                            child: MyText(text: "https://artwounds.com",
                                            fontSize: appSize.width*0.047,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Icon(Icons.credit_card,size: 47,)),
              MyText(text: "Budget",
                fontWeight: FontWeight.w400,
                fontSize: appSize.width*0.033,
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
      SizedBox(height: appSize.height*0.04,),

      Row(

        children: [
          SizedBox(width: appSize.width*0.17,),
          GestureDetector(
            onTap: (){
              clickfunction(0);
            },
            child: Container(
              height: 25,
              width: 25,

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
          SizedBox(width: appSize.width*0.025,),
          MyText(text: "Item 1",color: Colors.black,fontSize: appSize.width*0.043,fontWeight: FontWeight.w700,),
          SizedBox(width: appSize.width*0.16,),


        ],
      ),
      SizedBox(height: appSize.height*0.025,),

      Row(

        children: [
          SizedBox(width: appSize.width*0.17,),
          GestureDetector(
            onTap: (){
              clickfunction2(0);
            },
            child: Container(
              height: 25,
              width: 25,

              padding: EdgeInsets.all(1),

              decoration: BoxDecoration(
                  color: selected2==0?Colors.white:themeColor,
                  borderRadius: BorderRadius.circular(4),

                  border: Border.all(

                      color: selected2==0?themeColor:themeColor,

                      width: 1.5)

              ),
              child: Icon(Icons.check,color: Colors.white,size: 20,),
            ),
          ),
          SizedBox(width: appSize.width*0.025,),
          MyText(text: "Item 2",color: Colors.black,fontSize: appSize.width*0.043,fontWeight: FontWeight.w700,),
          SizedBox(width: appSize.width*0.16,),


        ],
      ),
      SizedBox(height: appSize.height*0.025,),

      Row(

        children: [
          SizedBox(width: appSize.width*0.17,),
          GestureDetector(
            onTap: (){
              clickfunction4(0);
            },
            child: Container(
              height: 25,
              width: 25,

              padding: EdgeInsets.all(1),

              decoration: BoxDecoration(
                  color: selected4==0?Colors.white:themeColor,
                  borderRadius: BorderRadius.circular(4),

                  border: Border.all(

                      color: selected4==0?themeColor:themeColor,

                      width: 1.5)

              ),
              child: Icon(Icons.check,color: Colors.white,size: 20,),
            ),
          ),
          SizedBox(width: appSize.width*0.025,),
          MyText(text: "Item 3",color: Colors.black,fontSize: appSize.width*0.043,fontWeight: FontWeight.w700,),
          SizedBox(width: appSize.width*0.16,),


        ],
      ),
      SizedBox(height: appSize.height*0.025,),

      Row(

        children: [
          SizedBox(width: appSize.width*0.17,),
          GestureDetector(
            onTap: (){
              clickfunction3(0);
            },
            child: Container(
              height: 25,
              width: 25,

              padding: EdgeInsets.all(1),

              decoration: BoxDecoration(
                  color: selected3==0?Colors.white:themeColor,
                  borderRadius: BorderRadius.circular(4),

                  border: Border.all(

                      color: selected==0?themeColor:themeColor,

                      width: 1.5)

              ),
              child: Icon(Icons.check,color: Colors.white,size: 20,),
            ),
          ),
          SizedBox(width: appSize.width*0.025,),
          MyText(text: "Item 4 ",color: Colors.black,fontSize: appSize.width*0.043,fontWeight: FontWeight.w700,),
          SizedBox(width: appSize.width*0.16,),


        ],
      ),
      Padding(
        padding:  EdgeInsets.only(left: appSize.width*0.05,right: appSize.width*0.05,top: appSize.height*0.45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScannerScreen()),
                );
              },
              child: Container(
                child: Column(

                  children: [
                    Icon(Icons.qr_code_scanner,size: 47,),
                    MyText(text: "Scan Item",
                      fontWeight: FontWeight.w400,
                      fontSize: appSize.width*0.033,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            Column(

              children: [
                Icon(Icons.group_sharp,size: 47,),
                MyText(text: "Group Members",
                  fontWeight: FontWeight.w400,
                  fontSize: appSize.width*0.033,
                  color: Colors.grey,
                ),
              ],
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen()),
                );
              },
              child: Column(

                children: [
                  Icon(Icons.map_rounded,size: 47,),
                  MyText(text: "Store Map",
                    fontWeight: FontWeight.w400,
                    fontSize: appSize.width*0.033,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),

          ],
        ),
      )

    ],
  ),
),
    );
  }

}
