import 'dart:collection';

import 'lib/data.dart';

class Location {
  final int x;
  final int y;
  Location({
    required this.x,
    required this.y,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Location && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() => 'Location(x:$x,y:$y)';
}

class day03 {
  static int runA() {
    final data = Data.day03;
    final dataList = data.split('');
    var housePresentCount = <Location, int>{};
    var loc = Location(x: 0, y: 0);
    housePresentCount[loc] = (housePresentCount[loc] ?? 0) + 1;
    for (var i = 0; i < dataList.length; i++) {
      switch (dataList[i]) {
        case '^':
          loc = Location(x: loc.x, y: loc.y + 1);
          break;
        case '>':
          loc = Location(x: loc.x + 1, y: loc.y);
          break;
        case 'v':
          loc = Location(x: loc.x, y: loc.y - 1);
          break;
        case '<':
          loc = Location(x: loc.x - 1, y: loc.y);
          break;
        default:
          throw Exception('Unexpected character: ${dataList[i]}');
      }
      housePresentCount[loc] = (housePresentCount[loc] ?? 0) + 1;
    }

    housePresentCount.removeWhere((key, value) => value < 1);
    //print(housePresentCount);
    final housesWithAtLeastOnePresent = housePresentCount.length;

    print(
        'Day03a# Houses with more than one present: $housesWithAtLeastOnePresent');
    return housesWithAtLeastOnePresent;
  }

  static int runB() {
    final data = Data.day03;
    final dataList = data.split('');
    var housePresentCount = <Location, int>{};
    final dl1 = <String>[];
    final dl2 = <String>[];
    final q = Queue.from(dataList);
    while (q.isNotEmpty) {
      dl1.add(q.removeFirst());
      if (q.isNotEmpty) {
        dl2.add(q.removeFirst());
      }
    }
    deliverer('Santa', dl1, housePresentCount);
    deliverer('Robo-santa', dl2, housePresentCount);
    housePresentCount.removeWhere((key, value) => value < 1);
    final housesWithAtLeastOnePresent = housePresentCount.length;
    print(
        'Day03b# Houses with more than one present (2 deliverers): $housesWithAtLeastOnePresent');
    return housesWithAtLeastOnePresent;
  }

  static deliverer(String name, List<String> instuctions,
      Map<Location, int> housePresentCount) {
    var loc = Location(x: 0, y: 0);
    housePresentCount[loc] = (housePresentCount[loc] ?? 0) + 1;
    for (var i = 0; i < instuctions.length; i++) {
      loc = nextLocation(loc, instuctions[i]);
      housePresentCount[loc] = (housePresentCount[loc] ?? 0) + 1;
    }
  }

  static Location nextLocation(Location loc, String dir) {
    switch (dir) {
      case '^':
        return Location(x: loc.x, y: loc.y + 1);
      case '>':
        return Location(x: loc.x + 1, y: loc.y);
      case 'v':
        return Location(x: loc.x, y: loc.y - 1);
      case '<':
        return Location(x: loc.x - 1, y: loc.y);
      default:
        throw Exception('Unexpected direction: $dir');
    }
  }
}
