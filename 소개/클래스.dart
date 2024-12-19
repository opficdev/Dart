class Spacecraft {
  String name;  // 따로 설정하지 않았다면 public
  DateTime? launchDate;

  // Read-only non-final 프로퍼티
  int? get launchYear => launchDate?.year;

  // 멤버 할당애 신택틱 슈가를 사용한 생성자
  Spacecraft(this.name, this.launchDate) {
    // 여기에 초기화 코드가 이어짐
  }

  // 디폴트 생성자로 포워드하는 Named 생성자
  Spacecraft.unlaunched(String name): this(name, null);

  // 메서드
  void describe() {
    print("Spacecraft: $name");
    // Getter에는 타입 프로모션이 작동하지 않음
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print("Launched: $launchYear ($years years ago)");
    }
    else {
      print("Unlaunched");
    }
  }
}


void main() {
  var voyager = Spacecraft("Voyager I", DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched("Voyager III");
  voyager3.describe();
}

// Swift
// import Foundation

// class Spacecraft {
//     var name: String    // 따로 설정하지 않았다면 internal
//     var launchDate: Date?
    
//     var launchYear: Int? {
//         guard let launchDate = launchDate else {
//             return nil
//         }
//         return Calendar.current.component(.year, from: launchDate)
//     }

//     init(name: String, launchDate: Date? = nil) {
//         self.name = name
//         self.launchDate = launchDate
//     }
    
//     convenience init(unlaunched name: String) {
//         self.init(name: name, launchDate: nil)
//     }
    
//     func describe() {
//         print("Spacecraft: \(name)")
        
//         if let launchDate = launchDate, let launchYear = launchYear {
//             let years = Calendar.current.dateComponents([.year], from: launchDate, to: Date()).year!
//             print("Launched: \(launchYear) (\(years) years ago)")
//         }
//         else {
//             print("Unlaunched")
//         }
//     }
// }

// let voyager = Spacecraft(name: "Voyager I", launchDate: Calendar.current.date(from: DateComponents(year: 1977, month: 9, day: 5))!)
// voyager.describe()

// let voyager3 = Spacecraft(unlaunched: "Voyager III")
// voyager3.describe()