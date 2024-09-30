import 'dart:async';

import 'package:crypto/crypto.dart';
import 'dart:convert';

class day04 {
  static runA() async {
    final data = 'iwrupvqb';
    var secret = 0;
    var md5result = '';
    var input = '';

    final start = DateTime.now();
    while (md5result.startsWith('000000') == false) {
      secret++;
      input = data + secret.toString();
      md5result = md5.convert(utf8.encode(input)).toString();
      // if (secret % 100000 == 0) {
      //   //print('input: $input, hash: $md5result');
      //   await Future.delayed(Duration(milliseconds: 100));
      // }
    }
    final stop = DateTime.now();
    print('Day04a# input: $input (${stop.difference(start).inMilliseconds}ms)');
  }
}
