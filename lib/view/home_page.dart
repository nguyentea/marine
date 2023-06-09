
import 'package:marine/view/login.dart';
import 'package:marine/theme/colors.dart';
import 'package:marine/widgets/action_box.dart';
import 'package:marine/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
//import 'package:app/view/tag_read.dart';
import 'package:marine/view/empty_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: secondary,
        appBar: CustomAppbar(title: "Welcome to BK Lab!"),
        body: getBody(),
      );
  }


  getBody(){
    return
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            getActions(),
            SizedBox(height: 50,),
            getActions2(),

          ],
        ),
      );
  }

  getActions(){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 25,),
          Expanded(
              child: ActionBox(title: "Read NFC", icon: Icons.nfc, bgColor: green, linkscreen: EmptyPage())
          ),
          SizedBox(width: 35,),
          Expanded(
              child: ActionBox(title: "Gen QR", icon: Icons.qr_code_2, bgColor: purple, linkscreen: EmptyPage())
          ),
          SizedBox(width: 25,),
        ],
      );
  }

  getActions2(){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 25,),
          Expanded(
              child: ActionBox(title: "User Profile", icon: Icons.contact_page, bgColor: yellow, linkscreen: EmptyPage())
          ),
          SizedBox(width: 25,),
          Expanded(
              child: ActionBox(title: "Users Status", icon: Icons.manage_accounts, bgColor: blue, linkscreen: EmptyPage())
          ),
          SizedBox(width: 25,),
        ],
      );
  }
}