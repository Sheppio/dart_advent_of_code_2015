import 'lib/data.dart';

class day05 {
  static int runA() {
    final data = Data.day05;
    final lines = data.split('\n');
    int niceCount = 0;
    for (int i = 0; i < lines.length; i++) {
      var line = lines[i];
      print('\n\n$i) TESTING: $line');
      final x = isNice(line);
      if (x) {
        niceCount++;
        print('isNice count = $niceCount');
      }
      print('$line = $x');
    }
    print('Day05a# Nice count: $niceCount');
    return niceCount;
  }

  static int runB() {
    final regExTwoPairs = RegExp(r'(..).*\1');
    final regExRepeatedLetterAfterWithOneLetterGap = RegExp(r'(.).\1');
    final data = Data.day05;
    final lines = data.split('\n');
    final niceLines = lines
        .where((line) =>
            regExTwoPairs.hasMatch(line) &&
            regExRepeatedLetterAfterWithOneLetterGap.hasMatch(line))
        .toList();
    print('Day05b# Nice count: ${niceLines.length}');
    return niceLines.length;
  }
}

bool isNice(String line) {
  if (containsBadStrings(line)) {
    print('isNice=FALSE (containsBadStrings)');
    return false;
  }
  if (containsThreeVowels(line)) {
    print('containsThreeVowels, continuing...');
    if (containsDoubleLetters(line)) {
      print('isNice=TRUE (containsDoubleLetters)');
      return true;
    }
  } else {
    print('isNice=FALSE, not enough vowels');
    return false;
  }
  print('isNice=FALSE (nothing makes it nice...)');
  return false;
}

bool containsThreeVowels(String line) {
  var vowelCount = 0;
  for (var letter in line.split('')) {
    if (letter == 'a' ||
        letter == 'e' ||
        letter == 'i' ||
        letter == 'o' ||
        letter == 'u') {
      vowelCount++;
      if (vowelCount == 3) {
        print('containsThreeVowels (TRUE): $line ($vowelCount)');
        return true;
      }
    }
  }
  print('containsThreeVowels (FALSE) : $line ($vowelCount)');
  return false;
}

bool containsDoubleLetters(String line) {
  final letters = line.split('');
  for (var i = 0; i < letters.length - 1; i++) {
    if (letters[i] == letters[i + 1]) {
      print('containsDoubleLetters (TRUE): ${letters[i]}${letters[i + 1]}');
      return true;
    }
  }
  print('containsDoubleLetters (FALSE) : $line');
  return false;
}

// bool containsConsecutiveLetters(String line) {
//   final alphabet = 'abcdefghijklmnopqrstuvwxyz';
//   final letters = line.split('');
//   for (var i = 0; i < letters.length - 2; i++) {
//     if (letters[i] != 'z') {
//       final index = alphabet.indexOf(letters[i]);
//       if (letters[i + 1] == alphabet[index + 1]) {
//         print('containsConsecutiveLetters: ${letters[i]}${letters[i + 1]}');
//         return true;
//       }
//     }
//   }
//   return false;
// }

bool containsBadStrings(String line) {
  return line.contains('ab') ||
      line.contains('cd') ||
      line.contains('pq') ||
      line.contains('xy');
}
