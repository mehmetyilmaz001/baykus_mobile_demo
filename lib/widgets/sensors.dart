  import 'package:baykus_mobile_demo/models/box_types.dart';
import 'package:baykus_mobile_demo/providers/sensors.dart';
import 'package:baykus_mobile_demo/widgets/sensor_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

  class Sensors extends StatefulWidget {
  @override
  _SensorsState createState() => _SensorsState();
}

class _SensorsState extends State<Sensors> {

  @override
  void initState() {
    super.initState();
    Provider.of<SensorsProvider>(context, listen: false).setTimer();
  }

  
    @override
    Widget build(BuildContext context) {

      final temp = Provider.of<SensorsProvider>(context).temp;

      if(temp == null){
        Provider.of<SensorsProvider>(context).fetchTemp();
      }

      return Container(
                        width: 195,
                        margin: EdgeInsets.only(top: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SensorItem(
                                icon: 'temp',
                                title: 'Sıcaklık',
                                value: temp,
                                isUp: false,
                                boxType: BoxTypes.danger),
                            SensorItem(
                                icon: 'humadity',
                                title: 'Nem',
                                value: '%50',
                                isUp: true,
                                boxType: BoxTypes.succcess),
                            SensorItem(
                                icon: 'smog',
                                title: 'Duman',
                                value: '%10',
                                isUp: false,
                                boxType: BoxTypes.warning),
                          ],
                        ),
                      );
    }
}