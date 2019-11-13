import 'package:flutter/material.dart';
import 'models/box_types.dart';


class Helper {
  static Map<int, Color> getBoxColor(BoxTypes type) {
    switch (type) {
      case BoxTypes.succcess:
        return {0: Color.fromRGBO(243, 255, 227, 1), 1: Color.fromRGBO(217, 255, 168, 1)};
        break;
      case BoxTypes.warning:
        return {0: Color.fromRGBO(253, 250, 222, 1), 1: Color.fromRGBO(253, 244, 161, 1)};
        break;
      case BoxTypes.danger:
        return {0: Color.fromRGBO(255, 201, 201, 1), 1: Color.fromRGBO(255, 153, 153, 1)};
        break;
      case BoxTypes.info:
        return {0: Colors.lightBlue, 1: Colors.blue};
        break;
      default:
        return {0: Colors.grey, 1: Colors.blueGrey};
    }
  }
}
