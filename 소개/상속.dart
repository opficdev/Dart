import '클래스.dart';

// 단일 상속 가능
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

// Swift
// class Orbiter: Spacecraft {
//     var altitude: Double

//     init(name: String, launchDate: Date, altitude: Double) {
//         self.altitude = altitude
//         super.init(name: name, launchDate: launchDate)
//     }
// }