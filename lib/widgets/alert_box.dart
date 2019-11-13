import 'dart:async';

import 'package:baykus_mobile_demo/helper.dart';
import 'package:baykus_mobile_demo/models/box_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AlertBox extends StatefulWidget {
  final String message;
  final String icon;
  final BoxTypes type;

  AlertBox({this.icon = 'temp', this.message, this.type});

  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  double boxOpacity = 1.0;
  @override
  void initState() {
    super.initState();
    setOpacityTimer();
  }

  void setOpacityTimer() {
    Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        if(boxOpacity == 1.0){
          boxOpacity = 0.6;
        }else{
          boxOpacity = 1.0;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: widget.type != BoxTypes.danger ? 1.0 : boxOpacity,
        duration: Duration(milliseconds: 300),
          child: Container(
        decoration: BoxDecoration(color: Helper.getBoxColor(widget.type)[0], borderRadius: BorderRadius.circular(5)),
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset('assets/images/${widget.icon}_icon.svg'),
            SizedBox(width: 5,),
            Text(widget.message, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          ],
        ),
      ),
    );
  }
}
