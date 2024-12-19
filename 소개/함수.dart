import "변수.dart";

int fibo(int n) {
  if (n == 0 || n == 1) return n;
  return fibo(n - 1) + fibo(n - 2);
}

// swift
// func fibo(_ n: Int) -> Int {
//   if n == 0 || n == 1 {
//     return n
//   }
//   return fibo(n - 1) + fibo(n - 2)
// }

void main() {
  var result = fibo(20);
  print(result);

  // 화살표 문법
  flybyObjects.where((name) => name.contains("turn")).forEach(print);

  // swift
  // flybyObjects
  //   .filter { $0.contains("turn") }
  //   .forEach { print($0) }
}