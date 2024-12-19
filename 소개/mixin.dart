import '클래스.dart';

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print("Number of astronauts: $astronauts");
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  // PilotedCraft는 Spacecraft와 Piloted를 함께 사용
   PilotedCraft(String name, DateTime? launchDate, int astronauts)
      : super(name, launchDate) {
    // 생성자에서 astronauts 값을 수정
    this.astronauts = astronauts;
  }
}

void main() {
   var spacecraft = PilotedCraft("Explorer", DateTime(2020, 5, 1), 5);
  spacecraft.describe(); // Spacecraft의 describe 메서드 호출
  spacecraft.describeCrew(); // Piloted의 describeCrew 메서드 호출
}

// Swift
// // Piloted 프로토콜
// protocol Piloted {
//     var astronauts: Int { get set }
//     func describeCrew() // 프로토콜에서는 함수 선언만 가능
// }

// extension Piloted {
//     // Piloted 프로토콜에서 기본 구현
//     func describeCrew() {
//         print("Number of astronauts: \(astronauts)")
//     }
// }

// // PilotedCraft 클래스
// class PilotedCraft: Spacecraft, Piloted {
//     var astronauts: Int

//     // 생성자에서 astronauts 값을 수정
//     init(name: String, launchDate: Date?, astronauts: Int) {
//         self.astronauts = astronauts
//         super.init(name: name, launchDate: launchDate)
//     }
// }

// let spacecraft = PilotedCraft(name: "Explorer", launchDate: Date(timeIntervalSince1970: 1588291200), astronauts: 5)
// spacecraft.describe()       // Spacecraft의 describe 메서드 호출
// spacecraft.describeCrew()   // Piloted의 describeCrew 메서드 호출