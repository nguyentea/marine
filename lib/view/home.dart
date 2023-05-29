import 'dart:async';

import 'package:marine/view/home_page.dart';
//import 'package:marine/view/setting_page.dart';
import 'package:marine/theme/colors.dart';
// import 'package:marine/view/ScanQR.dart';
// import 'package:marine/view/user_page.dart';
// import 'package:marine/view/about.dart';
import 'package:marine/widgets/bottombar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeTab = 0;

  // Start check Internet
  // 29-81
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlerSet = false;
  void initState() {
    super.initState();
    getConnectivity();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult result) async{
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if(!isDeviceConnected && isAlerSet == false){
            showDialogBox();
            setState(() => isAlerSet = true);
          }
          setState(() => isAlerSet = false);          },
      );

  showDialogBox() => showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Column(
          children: [
            Icon(Icons.warning,color: Colors.red,),
            Text('No Connection'),
          ],
        ),
        content: Text('Please check your internet connectivity'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.pop(context,'Cancel');
              setState(() => isAlerSet = false);
              isDeviceConnected = await InternetConnectionChecker().hasConnection;
              if(!isDeviceConnected){
                showDialogBox();
                setState(() => isAlerSet = true);
              }
            },
            child: Text("Ok"),
          )
        ],
      )
  );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  // End Check Internet 29 - 81

  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(
        color: appBgColor.withOpacity(.95),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)
        ),
      ),

      child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: getBottomBar(),
          floatingActionButton: getHomeButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
          body: getBarPage()
      ),
    );
  }
  Widget getHomeButton(){
    double  heightR,widthR;
    heightR = MediaQuery.of(context).size.height / 1080; //v26
    widthR = MediaQuery.of(context).size.width / 2400;
    var curR = widthR;
    return Container(
      margin: EdgeInsets.only(top: 28*heightR),
      // padding: EdgeInsets.all(30*heightR),
      child: GestureDetector(
        onTap: () {
          setState(() {
            activeTab= 2;
          });
        },
        child: Container(
          padding: EdgeInsets.all(60*curR),
          decoration: BoxDecoration(
            border: Border.all(
              color: primary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: primary,
            //shape: BoxShape.circle,
          ),
           child: Icon(Icons.qr_code_scanner,
            color: Colors.white,
            size: 270*curR,),
        ),
      ),
    );
  }

  Widget getBottomBar() {
    double  heightR,widthR;
    heightR = MediaQuery.of(context).size.height / 1080; //v26
    widthR = MediaQuery.of(context).size.width / 2400;
    var curR = widthR;
    return Container(
      height: 128*heightR,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25)
          ),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: .5,
                spreadRadius: .5,
                offset: Offset(0, 1)
            )
          ]
      ),
      child: Padding(
          padding:  EdgeInsets.only(left: 125*widthR, right: 125*widthR,top: 10*heightR),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomBarItem(
                  Icons.home_rounded,
                  "Home",
                  isActive: activeTab == 0,
                  activeColor: primary,
                  onTap: () {
                    setState(() {
                      activeTab = 0;
                    });
                  },
                ),
                BottomBarItem(
                  Icons.person_rounded,
                  "Users",
                  isActive: activeTab == 1,
                  activeColor: primary,
                  onTap: () {
                    setState(() {
                      activeTab = 1;
                    });
                  },
                ),
                BottomBarItem(
                  Icons.qr_code_scanner,
                  "Scan QR",
                  isActive: activeTab == 2,
                  activeColor: primary,
                  onTap: () {
                    setState(() {
                      activeTab = 2;
                    });
                  },
                ),
                BottomBarItem(
                  Icons.settings,
                  "Setting",
                  isActive: activeTab == 3,
                  activeColor: primary,
                  onTap: () {
                    setState(() {
                      activeTab = 3;
                    });
                  },
                ),

              ]
          )
      ),
    );
  }

  Widget getBarPage(){

    return
      IndexedStack(
        index: activeTab,
        children: <Widget>[
          HomePage(),
          HomePage(),
          HomePage(),
          HomePage(),
          HomePage(),
        ],
      );
  }
}