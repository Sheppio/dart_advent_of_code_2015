import 'dart:convert';
import 'dart:math';

import 'lib/data.dart';

class day08 {
  static int runA() {
    final data = Data.day08;
    final lines = data.split('\n');
    final processedLines = List<String>.empty(growable: true);
    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      var tmp = line.substring(1, line.length - 1);
      tmp = tmp.replaceAll(r'\\', r'\');
      tmp = tmp.replaceAll(r'\"', r'"');
      tmp = tmp.replaceAllMapped(RegExp(r'\\x(?<hex>[a-f0-9]{2})'),
          (Match match) {
        var matchedString = match.group(0) as String;
        final hexPart = matchedString.substring(2, 4);
        final dec = int.parse(hexPart, radix: 16);
        final char = String.fromCharCode(dec);
        //print('hex found: ${matchedString}');
        //print('hex: $hexPart, dec: $dec, char: $char');
        return char;
      });
      print('${(i + 1).toString().padLeft(4)}| $line -> $tmp');
      processedLines.add(tmp);
    }
    final linesLength = lines.join('').length;
    final processedLinesLength = processedLines.join('').length;
    final diff = linesLength - processedLinesLength;
    print([linesLength, processedLinesLength, diff]);

    return 0;
  }

  static int runB() {
    final data = Data.day08;
    final lines = data.split('\n');
    final encodedLines = List<String>.empty(growable: true);
    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      var tmp = line.toString();
      tmp = tmp.replaceAll(r'\', r'\\');
      tmp = tmp.replaceAll(r'"', r'\"');
      tmp = '"$tmp"';
      print(
          '${(i + 1).toString().padLeft(4)}| $line (${line.length}) -> $tmp (${tmp.length})');
      encodedLines.add(tmp);
    }
    final linesLength = lines.join('').length;
    final processedLinesLength = encodedLines.join('').length;
    final increase = processedLinesLength - linesLength;
    print([linesLength, processedLinesLength, increase]);

    return 0;
  }
}
