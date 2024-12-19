import '변수.dart';

void main() {
  if (2000 < year) {
    print("21세기");
  }
  else if (1901 < year) {
    print("20세기");
  }

  for (final object in flybyObjects) {
    print(object);
  }

//  Swift
//  for month in [1..<13] {
//    print(month)
//  }
  for (var month = 1; month < 13; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
}