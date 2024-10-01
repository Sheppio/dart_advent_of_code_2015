import 'lib/data.dart';

class day06 {
  static int runA() {
    final xCount = 1000;
    final yCount = 1000;
    final lights =
        List.generate(xCount, (_) => List.generate(yCount, (_) => false));
    // printLights(lights);
    // lights[7][7] = true;
    // printLights(lights);

    final data = Data.day06;
    final lines =
        data.split('\n').map((e) => e.replaceFirst('turn ', '')).toList();
    for (var i = 0; i < lines.length; i++) {
      final tokens = lines[i].split(' ');
      final fromTokens = tokens[1].split(',');
      final toTokens = tokens[3].split(',');
      processInstruction(
          lights,
          tokens[0],
          int.parse(fromTokens[0]),
          int.parse(fromTokens[1]),
          int.parse(toTokens[0]),
          int.parse(toTokens[1]));
      // printLights(lights);
      // int lightCount = getLightCount(lights);
      // print('day06a: $lightCount');
    }
    int lightCount = getLightCount(lights);
    print('day06a: $lightCount');
    return lightCount;
  }

  static int getLightCount(List<List<bool>> lights) {
    int lightCount = 0;
    for (var row in lights) {
      for (var col in row) {
        if (col) {
          lightCount++;
        }
      }
    }
    return lightCount;
  }

  static printLights(List<List<bool>> lights) {
    for (var row in lights) {
      print(row.map((e) => e ? '#' : '.').join('') + row.hashCode.toString());
    }
  }

  static turnOn(List<List<bool>> lights, int x, int y) {
    lights[x][y] = true;
  }

  static turnOff(List<List<bool>> lights, int x, int y) {
    lights[x][y] = false;
  }

  static toggle(List<List<bool>> lights, int x, int y) {
    lights[x][y] = !lights[x][y];
  }

  static processInstruction(List<List<bool>> lights, String type, int fromX,
      int fromY, int toX, int toY) {
    for (var y = fromY; y <= toY; y++) {
      for (var x = fromX; x <= toX; x++) {
        switch (type) {
          case 'on':
            turnOn(lights, x, y);
            break;
          case 'off':
            turnOff(lights, x, y);
            break;
          case 'toggle':
            toggle(lights, x, y);
            break;
          default:
            throw Exception('Unknown instruction: $type');
        }
      }
    }
  }

  static int runB() {
    final xCount = 1000;
    final yCount = 1000;
    final lights =
        List.generate(xCount, (_) => List.generate(yCount, (_) => 0));
    // printLights(lights);
    // lights[7][7] = true;
    // printLights(lights);

    final data = Data.day06;
    final lines =
        data.split('\n').map((e) => e.replaceFirst('turn ', '')).toList();
    for (var i = 0; i < lines.length; i++) {
      final tokens = lines[i].split(' ');
      final fromTokens = tokens[1].split(',');
      final toTokens = tokens[3].split(',');
      processInstructionB(
          lights,
          tokens[0],
          int.parse(fromTokens[0]),
          int.parse(fromTokens[1]),
          int.parse(toTokens[0]),
          int.parse(toTokens[1]));
      // printLights(lights);
      // int lightCount = getLightCount(lights);
      // print('day06a: $lightCount');
    }
    int lightsTotalBrighness = getLightsTotalBrighness(lights);
    print('day06b: $lightsTotalBrighness');
    return lightsTotalBrighness;
  }

  static processInstructionB(List<List<int>> lights, String type, int fromX,
      int fromY, int toX, int toY) {
    for (var y = fromY; y <= toY; y++) {
      for (var x = fromX; x <= toX; x++) {
        switch (type) {
          case 'on':
            lights[x][y]++;
            break;
          case 'off':
            if (lights[x][y] > 0) {
              lights[x][y]--;
            }
            break;
          case 'toggle':
            lights[x][y] += 2;
            break;
          default:
            throw Exception('Unknown instruction: $type');
        }
      }
    }
  }

  static int getLightsTotalBrighness(List<List<int>> lights) {
    int lightTotBri = 0;
    for (var row in lights) {
      for (var val in row) {
        lightTotBri += val;
      }
    }
    return lightTotBri;
  }
}
