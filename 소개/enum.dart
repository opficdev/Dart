// 간단하게 행성 타입을 정의하기
enum PlanetType { terrestrial, gas, ice }

// 우리 태양계에 있는 행성들과 행성들의 프로퍼티에 대한 Enum
enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  // ···
  earth(planetType: PlanetType.terrestrial, moons: 1, hasRings: false),
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  /// 상수를 생성하는 생성자
  const Planet(
    {required this.planetType, required this.moons, required this.hasRings});

  /// 모든 인스턴스 변수들은 final
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  /// 발전된 enum은 getter와 다른 메서드를 지원
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

void main() {
  final yourPlanet = Planet.earth;
  if (!yourPlanet.isGiant) {
    print("Your planet is not a giant \"giant planet\".");
  }
}

// Swift
// enum PlanetType {
//     case terrestrial, gas, ice
// }

// // 태양계의 행성 정의
// enum Planet {
//     case mercury
//     case venus
//     case earth
//     case uranus
//     case neptune

//     // 각 행성의 관련된 정보 저장
//     var planetType: PlanetType {
//         switch self {
//         case .mercury, .venus, .earth:
//             return .terrestrial
//         case .uranus, .neptune:
//             return .ice
//         }
//     }

//     var moons: Int {
//         switch self {
//         case .mercury, .venus:
//             return 0
//         case .earth:
//             return 1
//         case .uranus:
//             return 27
//         case .neptune:
//             return 14
//         }
//     }

//     var hasRings: Bool {
//         switch self {
//         case .uranus, .neptune:
//             return true
//         default:
//             return false
//         }
//     }

//     // 발전된 enum 메서드 (거대 행성인지 여부 확인)
//     var isGiant: Bool {
//         return planetType == .gas || planetType == .ice
//     }
// }

// let yourPlanet = Planet.earth
// if !yourPlanet.isGiant {
//     print("Your planet is not a giant \"giant planet\".")
// }
