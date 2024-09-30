import 'dart:math';

import 'lib/data.dart';

class day02 {
  static int runA() {
    final data = Data.day02;
    final dataList = data.split('\n');
    final sum = dataList
        .map((e) => areaForDimensionString(e))
        .reduce((value, element) => value + element);
    print('Day01a# Wrapping paper needed: $sum');
    return sum;
  }

  static int runB() {
    final data = Data.day02;
    final dataList = data.split('\n').map((e) => dimensions(e)).toList();
    var ribbonNeeded = dataList.map((d) {
      final shortestTwoSides = SamllestTwoSides([d.l, d.w, d.h]);
      final ribbonForSides = 2 * shortestTwoSides[0] + 2 * shortestTwoSides[1];
      final ribbonForBow = d.l * d.w * d.h;
      return ribbonForSides + ribbonForBow;
    }).reduce((value, element) => value + element);
    print('Day02b# Ribbon needed: $ribbonNeeded');
    return ribbonNeeded;
  }

  static List<int> SamllestTwoSides(List<int> list) {
    list..sort();
    return list.take(2).toList();
  }

  static ({int h, int l, int w}) dimensions(String dimStr) {
    final split = dimStr.split('x');
    return (
      l: int.parse(split[0]),
      w: int.parse(split[1]),
      h: int.parse(split[2])
    );
  }

  static int areaForDimensionString(String dimStr) {
    final split = dimStr.split('x');
    final dim = dimensions(dimStr);
    final lw = dim.l * dim.w;
    final lh = dim.l * dim.h;
    final wh = dim.w * dim.h;
    final smallestArea = min(lw, min(lh, wh));
    return (2 * lw) + (2 * lh) + (2 * wh) + smallestArea;
  }
}
