import 'dart:convert';
import 'dart:math';

import 'lib/data.dart';

class day10 {
  static String runAB() {
    RegExp regExp = RegExp(r'(\d)\1*');
    var data = '1321131112';
    //var data = '1';
    final start = DateTime.now();
    for (var loop = 0; loop < 50; loop++) {
      final matches = regExp.allMatches(data);
      final mi = matches.iterator;
      final sb = StringBuffer();
      while (mi.moveNext()) {
        final token = mi.current.group(0)!;
        //  print(token);
        sb.write('${token.length}${token.substring(0, 1)}');
      }
      data = sb.toString();
      //print('\n\n*****\n$data');
    }
    final end = DateTime.now();
    print('${data.length} (${end.difference(start).inMilliseconds}ms)');
    return data;
  }
}
