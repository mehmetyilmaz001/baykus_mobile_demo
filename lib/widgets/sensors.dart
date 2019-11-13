import 'package:baykus_mobile_demo/helper.dart';
import 'package:baykus_mobile_demo/providers/sensors_provider.dart';
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
    // final temp = Provider.of<SensorsProvider>(context).temp;

    // if (temp == null) {
    //   Provider.of<SensorsProvider>(context).fetchTemp();
    // }

    print("build");

    return Container(
      width: 195,
      margin: EdgeInsets.only(top: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Consumer<SensorsProvider>(
            builder: (ctx, sensors, _) => SensorItem(
                icon: 'temp',
                title: 'Sıcaklık',
                value: sensors.temp == null ?  "..." : "${sensors.temp} C",
                arrowType: sensors.arrowType,
                border: sensors.temp != sensors.prevTemp ? Border.all(color: Helper.getBoxColor(sensors.alert.type)[1], width: 3) : Border.all(color: Helper.getBoxColor(sensors.alert.type)[0], width: 3),
                boxType: sensors.alert.type),
          ),
          // SensorItem(
          //     icon: 'humadity',
          //     title: 'Nem',
          //     value: '%50',
          //     isUp: true,
          //     boxType: BoxTypes.succcess),
          // SensorItem(
          //     icon: 'smog',
          //     title: 'Duman',
          //     value: '%10',
          //     isUp: false,
          //     boxType: BoxTypes.warning),
        ],
      ),
    );
  }
}
