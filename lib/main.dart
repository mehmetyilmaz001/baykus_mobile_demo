import 'package:baykus_mobile_demo/providers/sensors_provider.dart';
import 'package:baykus_mobile_demo/widgets/alert_box.dart';
//import 'package:baykus_mobile_demo/widgets/sensor_item.dart';
import 'package:baykus_mobile_demo/widgets/sensors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: SensorsProvider(),
        ),
        
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.purple, fontFamily: 'RobotoCondensed'),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
        appBar: AppBar(
          title: Text("BAYKUŞ"),
          backgroundColor: Color.fromRGBO(74, 19, 140, 1),
        ),
        body: Stack(
          children: <Widget>[
            CenterWidget(),
            Positioned(
              bottom: 0.0,
              child: Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(74, 19, 140, 1)),
                child: SizedBox(
                  height: 10,
                ),
              ),
            ),
          ],
        ));
  }
}

class CenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SvgPicture.asset('assets/images/logo.svg'),
            Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Column(
                    children: <Widget>[
                      Consumer<SensorsProvider>(
                        builder: (ctx, sensor, _) => AlertBox(
                          icon: 'temp',
                          message: sensor.alert.title,
                          type: sensor.alert.type,
                        ),
                      ),
                      // AlertBox(
                      //   icon: 'temp',
                      //   message: 'SICAKLIK KRİTİK SEVİYEDE',
                      //   type: BoxTypes.danger,
                      // ),
                      Sensors()
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
