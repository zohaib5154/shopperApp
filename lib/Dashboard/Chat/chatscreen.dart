
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopperapp/Dashboard/Chat/components/userpic.dart';
import 'package:shopperapp/Utills/colors.dart';
import 'package:shopperapp/Widgets/mytext.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _topChat(),
                SizedBox(height: 10,),
                _bodyChat(),
                SizedBox(
                  height: 85,
                )
              ],
            ),
            _formChat(),
          ],
        ),
      ),
    );
  }

  _topChat() {
    var appSize=MediaQuery.of(context).size;
    return Container(
      color: themeColor,
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 23,)
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18,
                        backgroundImage: AssetImage("assets/images/applogo.png"),
                      ),
                      SizedBox(width: appSize.width*0.015,),
                      MyText(text: "John Smith",
                      fontSize: appSize.width*0.035,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyChat() {
    return Expanded(
      child: Container(

        padding: EdgeInsets.only(left: 25, right: 25, top: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: lightColor,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _itemChat(
              avatar: 'assets/image/5.jpg',
              chat: 1,
              message:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message: 'Okey 🐣',
              time: '18.00',
            ),
            _itemChat(
              avatar: 'assets/image/5.jpg',
              chat: 1,
              message: 'It has survived not only five centuries, 😀',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message:
              'Contrary to popular belief, Lorem Ipsum is not simply random text. 😎',
              time: '18.00',
            ),
            _itemChat(
              avatar: 'assets/image/5.jpg',
              chat: 1,
              message:
              'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
              time: '18.00',
            ),
            _itemChat(
              avatar: 'assets/image/5.jpg',
              chat: 1,
              message: '😅 😂 🤣',
              time: '18.00',
            ),
          ],
        ),
      ),
    );
  }

  // 0 = Send
  // 1 = Recieved
  _itemChat({int? chat, String? avatar, message, time}) {
    return Row(
      mainAxisAlignment:
      chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        avatar != null
            ? Avatar(
          image: avatar,
          size: 30,
        )
            : Text(
          '$time',
          style: TextStyle(color: Colors.grey.shade400),
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: chat == 0 ?themeColor : Colors.grey.withOpacity(.5),
              borderRadius: chat == 0
                  ? BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              )
                  : BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: MyText(text: '$message',color: Colors.white,),
          ),
        ),
        chat == 1
            ? Text(
          '$time',
          style: TextStyle(color: Colors.grey.shade400),
        )
            : SizedBox(),
      ],
    );
  }

  Widget _formChat() {
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 85,
          padding: EdgeInsets.symmetric(vertical: 17, horizontal: 22),
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Type your message...',
              hintStyle: TextStyle(
                color: Colors.grey
              ),
              // suffixIcon: SvgPicture.asset("assets/images/oval.svg"),
              suffixIcon: Padding(
                padding:  EdgeInsets.only(right: 2,top: 10,bottom: 10),
                child: CircleAvatar(
                    radius: 30,
                    backgroundColor: themeColor,

                    child: SvgPicture.asset("assets/images/msg.svg",
                    height: 18,
                    ),


                ),
              ),
              filled: true,
              fillColor: lightColor,
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.all(20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: lightColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: lightColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

