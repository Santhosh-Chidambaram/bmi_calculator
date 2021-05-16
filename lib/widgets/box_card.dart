import 'package:flutter/material.dart';
import '../constants.dart';
//Created Custom BoxCard with Color and Widgets


class BoxCard extends StatelessWidget {
  BoxCard({@required this.color, this.boxChild,this.onPress});
  final Color color;
  final Widget boxChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
          onTap: onPress,
      child: Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: this.color, borderRadius: BorderRadius.circular(10.0)),
          child: boxChild),
    )
    );
  }
}

//Created Custom BoxContent with Icon and Text Data
class BoxContent extends StatelessWidget {
  BoxContent({this.icon, this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: kiconSize,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text.toUpperCase(),
          style: klabelStyle,
        )
      ],
    );
  }
}
