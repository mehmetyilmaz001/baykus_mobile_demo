import 'package:baykus_mobile_demo/models/box_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper.dart';

class SensorItem extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  final bool isUp;
  final BoxTypes boxType;

  const SensorItem(
      {@required this.icon,
      @required this.title,
      @required this.value,
      @required this.boxType,
      this.isUp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Helper.getBoxColor(boxType),
          borderRadius: BorderRadius.circular(5)),
      width: 50,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(isUp ? Icons.arrow_drop_up : Icons.arrow_drop_down),
          SizedBox(
            height: 15,
          ),
          Text(value == null ? "" : value),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 30,
            child: SvgPicture.asset('assets/images/${icon}_icon.svg')),
          Text(
            title,
            style: TextStyle(fontSize: 11),
          )
        ],
      ),
    );
  }
}
