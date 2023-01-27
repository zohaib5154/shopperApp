
import 'package:flutter/material.dart';
import 'package:shopperapp/Dashboard/homescreen/homescreen.dart';
import 'package:shopperapp/Dashboard/newuser/addnewuser_screen.dart';
import 'package:shopperapp/Utills/colors.dart';





class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {


  TextEditingController categoryController=TextEditingController();
  final formKey=GlobalKey<FormState>();


  TextEditingController titleController=TextEditingController();
  TextEditingController descController=TextEditingController();




  String selectedCategory = 'Select Group';

  // List of items in our dropdown menu
  List<dynamic> items = ["Select Group"];
  bool isLoading=false;




  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
appBar: AppBar(
  backgroundColor: themeColor,
  bottom: const TabBar(
    tabs: <Widget>[
      Tab(
        icon: Icon(Icons.list_alt,color: Colors.white,size: 35,),
      ),
      Tab(
        icon: Icon(Icons.group_add_outlined,color: Colors.white,size: 35,),
      ),
      Tab(
        icon: Icon(Icons.shopping_cart,color: Colors.white,size: 35,),
      ),
    ],
  ),
  leading: Icon(Icons.menu,color: Colors.white,size: 25,),
  centerTitle: true,
  title: Text("HomeScreen",style: TextStyle(
      color: Colors.white
  ),),
  actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewUserInviteScreen()),
              );
            },
            child: Icon(Icons.person_add_alt_1_rounded,color: Colors.white,size: 27,)),
      )
  ],
),
        body:TabBarView(
          children: [
            HomeScreen(),
            HomeScreen(),
            HomeScreen()
          ],
        )

      ),
    );
  }


}
