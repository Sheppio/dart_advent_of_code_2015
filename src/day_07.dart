import 'lib/data.dart';

class day07 {
  static int runA() {
    // AND
    // OR
    // NOT
    // LSHIFT
    // RSHIFT
    final data = Data.day07;
    final wireVals = <String, int>{};
    final linesTokensToProcess =
        data.split('\n').map((e) => e.split(' ')).toList();
    while (linesTokensToProcess.isNotEmpty) {
      //print('\n\n**********\n${linesTokensToProcess.join('\n')}');
      var linesTokensInProgress = List<List<String>>.from(linesTokensToProcess);
      linesTokensToProcess.clear();
      for (var tokens in linesTokensInProgress) {
        //print('Processing: $tokens');
        var processed = false;
        if (tokens.length == 3) {
          var in1 = getLiteralOrWireValue(wireVals, tokens[0]);
          if (in1 != null) {
            wireVals[tokens[2]] = in1;
            processed = true;
          }
        } else if (tokens[1] == 'AND') {
          final a = getLiteralOrWireValue(wireVals, tokens[0]);
          final b = getLiteralOrWireValue(wireVals, tokens[2]);
          if (a != null && b != null) {
            wireVals[tokens[4]] = a & b;
            processed = true;
          }
        } else if (tokens[1] == 'OR') {
          final a = getLiteralOrWireValue(wireVals, tokens[0]);
          final b = getLiteralOrWireValue(wireVals, tokens[2]);
          if (a != null && b != null) {
            wireVals[tokens[4]] = a | b;
            processed = true;
          }
        } else if (tokens[1] == 'LSHIFT') {
          final a = getLiteralOrWireValue(wireVals, tokens[0]);
          if (a != null) {
            wireVals[tokens[4]] = a << int.parse(tokens[2]);
            processed = true;
          }
        } else if (tokens[1] == 'RSHIFT') {
          final a = getLiteralOrWireValue(wireVals, tokens[0]);
          if (a != null) {
            wireVals[tokens[4]] = a >> int.parse(tokens[2]);
            processed = true;
          }
        } else if (tokens[0] == 'NOT') {
          final a = getLiteralOrWireValue(wireVals, tokens[1]);
          if (a != null) {
            wireVals[tokens[3]] = 65535 ^ a;
            processed = true;
          }
        }
        if (processed == false) {
          linesTokensToProcess.add(tokens);
        }
      }
      print('WireVals: $wireVals');
      print("WireVals['a']: ${wireVals['a']}");
    }
    return 0;
  }

  static int? getLiteralOrWireValue(Map<String, int> wireVals, String token) {
    return int.tryParse(token) ?? wireVals[token];
  }
}
