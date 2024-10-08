import 'package:args/args.dart';

import '../src/day_01.dart';
import '../src/day_02.dart';
import '../src/day_03.dart';
import '../src/day_04.dart';
import '../src/day_05.dart';
import '../src/day_06.dart';
import '../src/day_07.dart';
import '../src/day_08.dart';
import '../src/day_10.dart';

const String version = '0.0.1';

ArgParser buildParser() {
  return ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Print this usage information.',
    )
    ..addFlag(
      'verbose',
      abbr: 'v',
      negatable: false,
      help: 'Show additional command output.',
    )
    ..addFlag(
      'version',
      negatable: false,
      help: 'Print the tool version.',
    );
}

void printUsage(ArgParser argParser) {
  print('Usage: dart dart_advent_of_code_2015.dart <flags> [arguments]');
  print(argParser.usage);
}

void main(List<String> arguments) {
  final ArgParser argParser = buildParser();
  try {
    final ArgResults results = argParser.parse(arguments);
    bool verbose = false;

    // Process the parsed arguments.
    if (results.wasParsed('help')) {
      printUsage(argParser);
      return;
    }
    if (results.wasParsed('version')) {
      print('dart_advent_of_code_2015 version: $version');
      return;
    }
    if (results.wasParsed('verbose')) {
      verbose = true;
    }

    // Act on the arguments provided.
    print('Positional arguments: ${results.rest}');
    if (verbose) {
      print('[VERBOSE] All arguments: ${results.arguments}');
    }
  } on FormatException catch (e) {
    // Print usage information if an invalid argument was provided.
    print(e.message);
    print('');
    printUsage(argParser);
  }
  // day01.runA();
  // day01.runB();
  // day02.runA();
  // day02.runB();
  // day03.runA();
  // day03.runB();
  //day04.runA();
  //day05.runA();
  //day05.runB();
  //day06.runA();
  //day06.runB();
  //day07.runA();
  //day08.runA();
  //day08.runB();
  day10.runAB();
}
