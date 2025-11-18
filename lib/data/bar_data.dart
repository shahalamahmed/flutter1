import 'dart:ui';
import '../models/bar_model.dart';

class BarDataSet {
  static int interval = 5;

  static List<Data> barData = [
    Data(
      id: 0,
      name: 'Mon',
      y: 15,
      color: Color(0xffff4d94),
    ),
    Data(
      id: 1,
      name: 'Tue',
      y: 18,
      color: Color(0xfff99c2f),
    ),
    Data(
      id: 2,
      name: 'Wed',
      y: 12,
      color: Color(0xff4dd0e1),
    ),
    Data(
      id: 3,
      name: 'Thu',
      y: 20,
      color: Color(0xff9575cd),
    ),
    Data(
      id: 4,
      name: 'Fri',
      y: 25,
      color: Color(0xff4caf50),
    ),
  ];
}
