  import 'package:baykus_mobile_demo/models/box_types.dart';
import 'package:baykus_mobile_demo/widgets/sensor_item.dart';
import 'package:flutter/material.dart';

  class Sensors extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Container(
                        width: 195,
                        margin: EdgeInsets.only(top: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SensorItem(
                                icon: 'temp',
                                title: 'Sıcaklık',
                                value: '35C',
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