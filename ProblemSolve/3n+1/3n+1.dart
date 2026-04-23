import 'dart:io';
import 'dart:math';

var maxCnt = 0;

void collatz(int n) {
  var cnt = 1;
  var num = n;
  while (num != 1) {
    if (num & 1 != 0) {
      num = 3 * num + 1;
    } else {
      num >>= 1;
    }
    cnt += 1;
  }
  maxCnt = max(maxCnt, cnt);
}

void main() {
  var lines = File('3nplus1.inp').readAsLinesSync();
  var fout = File('3nplus1.out');
  var res = '';
  for (var line in lines) {
    if (line.trim().isEmpty) {
      continue;
    }
    maxCnt = 0;
    var ab = line.trim().split(RegExp(r'\s+')).map(int.parse).toList();
    var a = ab[0], b = ab[1];
    for (var i = min(a, b); i <= max(a, b); i++) {
      collatz(i);
    }
    res += '$a $b $maxCnt\n';
  }
  fout.writeAsStringSync(res);
}
