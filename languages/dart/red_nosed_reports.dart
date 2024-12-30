// https://adventofcode.com/2024/day/2

import 'dart:io';

void main(List<String> args) {
  File('./inputs/aoc/2024_2.txt').readAsString().then((String contents) {
    for (var problemDumpenerEnabled in [false, true]) {
      var safeValueCount = 0;
      for (var line in contents.split("\n")) {
        final report = line.split(" ");

        if (isReportSafe(report)) {
          safeValueCount++;
        } else if (problemDumpenerEnabled) {
          for (var i = 0; i < report.length; i++) {
            final List<String> dampedReport = List.from(report)..removeAt(i);
            if (isReportSafe(dampedReport)) {
              safeValueCount++;
              break;
            }
          }
        }
      }
      print("$problemDumpenerEnabled: $safeValueCount");
    }
  });
}

bool isReportSafe(List<String> report) {
  var previous = int.parse(report[0]);
  var last = int.parse(report[report.length - 1]);
  var isSafe = true;

  final isIncreasing = previous < last;

  for (var number in report.sublist(1).map((element) => int.parse(element))) {
    if ((number - previous).abs() > 3) {
      isSafe = false;
      break;
    }

    if (isIncreasing) {
      if (!(number > previous)) {
        isSafe = false;
        break;
      }
    } else {
      if (!(number < previous)) {
        isSafe = false;
        break;
      }
    }

    previous = number;
  }

  return isSafe;
}
