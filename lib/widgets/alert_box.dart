import 'package:baykus_mobile_demo/helper.dart';
import 'package:baykus_mobile_demo/models/box_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AlertBox extends StatelessWidget {
  final String message;
  final String icon;
  final BoxTypes type;

  AlertBox({this.icon = 'temp', this.message, this.type});

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Helper.getBoxColor(type), borderRadius: BorderRadius.circular(5)),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset('assets/images/${icon}_icon.svg'),
          SizedBox(width: 5,),
          Text(message, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        ],
      ),
    );
  }
}
