// https://adventofcode.com/2024/day/1

import 'dart:io';

void main(List<String> args) {
  File('./inputs/aoc/2024_1.txt').readAsString().then((String contents) {
    final List<String> col1 = <String>[];
    final List<String> col2 = <String>[];

    for (var line in contents.split('\n')) {
      final List<String> parts = line.split("   ");
      col1.add(parts[0]);
      col2.add(parts[1]);
    }

    col1.sort();
    col2.sort();

    final List<int> differences = <int>[];

    for (var i = 0; i < col1.length; i++) {
      final int fromCol1 = int.parse(col1[i]);
      final int fromCol2 = int.parse(col2[i]);

      final int difference = (fromCol1 - fromCol2).abs();
      differences.add(difference);
    }

    print("First: ${differences.reduce((value, element) => value + element)}");

    final List<int> occurrences = <int>[];

    for (var fromCol1 in col1) {
      final int count = col2.where((fromCol2) => fromCol2 == fromCol1).length;
      occurrences.add(count * int.parse(fromCol1));
    }

    print("Second: ${occurrences.reduce((value, element) => value + element)}");
  });
}
