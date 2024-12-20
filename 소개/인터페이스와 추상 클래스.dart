import '클래스.dart';

class MockSpaceship extends Describable implements Spacecraft {
  @override
  String name;

  @override
  DateTime? launchDate;

  MockSpaceship(this.name, this.launchDate);

  @override
  void describe() {
    print("MockSpaceship: $name");
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate!).inDays ~/ 365;
      print("Launched: $launchYear ($years years ago)");
    } else {
      print("Unlaunched");
    }
  }

  @override
  int? get launchYear => launchDate?.year;
}

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

void main() {
  // MockSpaceship 객체 생성
  var spaceship1 = MockSpaceship("Explorer", DateTime(2020, 5, 27));
  var spaceship2 = MockSpaceship("Voyager", null);

  // describe 메서드 호출
  spaceship1.describe();
  spaceship2.describe();

  print("\n--- Using describeWithEmphasis ---");

  // describeWithEmphasis 메서드 호출
  spaceship1.describeWithEmphasis();
  spaceship2.describeWithEmphasis();
}

// Swift
// protocol Describable {
//     func describe()

//     func describeWithEmphasis()
// }

// extension Describable {
//     func describeWithEmphasis() {
//         print("=========")
//         describe()
//         print("=========")
//     }
// }