
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shopperapp/Utills/colors.dart';



class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {

  final GlobalKey _gLobalkey = GlobalKey();
  QRViewController? controller;
  Barcode? result;
  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    var appSize=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.white,)),

        backgroundColor: themeColor,
        title: Text("Scan your product"),
      ),

      body: Center(
        child: Column(

          children: <Widget>[
            SizedBox(height: appSize.height*0.25,),
            Center(
              child: (result !=null) ? Text('${result!.code}',style: TextStyle(color: Colors.black,fontSize: appSize.width*0.04),) : Text("Please Scan the product ",style: TextStyle(color: Colors.black,fontSize: appSize.width*0.04)),
            ),
            SizedBox(height: appSize.height*0.04,),

            Stack(
              children: [

                Container(
                  height: appSize.height*0.3,
                  width: appSize.width*0.6,

                  child: QRView(
                    key: _gLobalkey,

                    onQRViewCreated: qr,

                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}