import 'package:marine/theme/colors.dart';
//import 'package:app/view/ScanQR.dart';
import 'package:flutter/material.dart';

class ActionBox extends StatelessWidget {
  ActionBox({ Key? key, required this.title, required this.icon, this.color, this.bgColor, required this.linkscreen}) : super(key: key);
  IconData icon;
  Color? color;
  Color? bgColor;
  String title;
  Widget linkscreen;

  @override
  Widget build(BuildContext context) {
    double heightR, widthR;
    heightR = MediaQuery.of(context).size.height / 1080; //v26
    widthR = MediaQuery.of(context).size.width / 2400;
    var curR = widthR;
    return
    GestureDetector(
      onTap: () {Navigator.push(
          context, MaterialPageRoute(
        builder: (context) => linkscreen,
      )
      );},
      child: Container(
        // width: double.infinity,
          height: 280 * heightR,
          padding: EdgeInsets.only(
              top: 40 * heightR,
              bottom: 20 * heightR,
              left: 57 * widthR,
              right: 57 * widthR),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: this.bgColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16 * heightR),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondary
                ),
                child: IconButton(
                  icon: Icon(icon),
                  iconSize: 208 * curR,
                  color: color,
                  onPressed: () {Navigator.push(context, MaterialPageRoute(
                    builder: (context) => linkscreen,
                  ));},
                ),
              ),
              // SizedBox(height: 16),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(left:25*widthR, right: 25*widthR),
                child: Text(
                  title,
                  style: TextStyle(
                      color: color,
                      fontSize: 100 * curR,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,

                ),
              ),

            ],
          )
      ),
    );
  }
}
