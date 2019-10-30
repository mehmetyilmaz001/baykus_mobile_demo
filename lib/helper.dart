import 'package:flutter/material.dart';
import 'models/box_types.dart';


class Helper {
  static Color getBoxColor(BoxTypes type) {
    switch (type) {
      case BoxTypes.succcess:
        return Color.fromRGBO(243, 255, 227, 1);
        break;
      case BoxTypes.warning:
        return Color.fromRGBO(253, 250, 222, 1);
        break;
      case BoxTypes.danger:
        return Color.fromRGBO(255, 227, 227, 1);
        break;
      case BoxTypes.info:
        return Colors.lightBlue;
        break;
      default:
        return Colors.grey;
    }
  }
}
