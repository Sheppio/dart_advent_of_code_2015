import 'lib/data.dart';

class day01 {
  static int runA() {
    final data = Data.day01;
    final dataList = data.split('');
    final upCount = dataList.where((e) => e == '(').length;
    final downCount = dataList.where((e) => e == ')').length;
    var finalFloor = upCount - downCount;
    print('Day01a# Final floor: $finalFloor');
    return finalFloor;
  }

  static int runB() {
    final data = Data.day01;
    final dataList = data.split('');
    var currentFloor = 0;

    for (var i = 0; i < dataList.length; i++) {
      switch (dataList[i]) {
        case '(':
          currentFloor++;
          break;
        case ')':
          currentFloor--;
          break;
      }
      final instrucitonPos = i + 1;
      //print('Instruction: $instrucitonPos, Floor: $currentFloor');
      if (currentFloor < 0) {
        print('Day01b# First basement reached at character: $instrucitonPos');
        return instrucitonPos;
      }
    }
    throw Exception('Basement never reached.');
  }
}
