import 'package:baykus_mobile_demo/models/arrow_type.dart';
import 'package:baykus_mobile_demo/models/box_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper.dart';

class SensorItem extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  final ArrowType arrowType;
  final BoxTypes boxType;
  final Border border;

  const SensorItem(
      {@required this.icon,
      @required this.title,
      @required this.value,
      @required this.boxType,
      this.border,
      this.arrowType});

  Widget _buildArrow(){
      if(arrowType == ArrowType.equals){
        return Icon(Icons.maximize);

      }else if(arrowType == ArrowType.up){
        return Icon(Icons.arrow_drop_up);

      }else if(arrowType == ArrowType.down){
        return Icon(Icons.arrow_drop_down);

      }else{
        return Icon(Icons.maximize);

      }
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Helper.getBoxColor(boxType)[0],
          border:  border,
          borderRadius: BorderRadius.circular(5)),
      width: 70,
      height: 165,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _buildArrow(),
          SizedBox(
            height: 15,
          ),
          Text(value == null ? "" : value, style: TextStyle(fontSize: 17)),
          SizedBox(
            height: 15,
          ),
          Container(
              height: 30,
              child: SvgPicture.asset('assets/images/${icon}_icon.svg')),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );

    
  }
}
