
void main() {
  // 산술 연산자
  assert(2 + 3 == 5); // assert(): 디버그 모드에서 주어진 조건이 false일 때 예외를 던짐
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // 실수값 나눗셈
  assert(5 ~/ 2 == 2); // 정수값 나눗셈
  assert(5 % 2 == 1); // 나머지 연산

  assert("5/2 = ${5 ~/ 2} r ${5 % 2}" == "5/2 = 2 r 1");  // 문자열 연산이므로 == 좌우의 문자열이 같아서 true

  // 전위 연산자와 후위 연산자
  var a, b;
  a = 0; 
  b = ++a; // b에 a(0)을 넣고 a에 + 1
  assert(a == b); // true

  a = 0; 
  b = a++; // a에 + 1 하고 b에 a(1)을 넣음
  assert(a != b);

  a = 0; 
  b = --a; // b에 a(0)을 넣고 a에 - 1
  assert(a == b); // true

  a = 0; 
  b = a--; // a에 - 1 하고 b에 a(-1)을 넣음
  assert(a != b);

  // 비교 연산자
  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);

  // 타입 테스트 연산자
  // as: 타입 캐스트
  // is: 객체가 특정 자료형일 때
  // is!: is의 반대

  // 대입 연산자
  var value; // null
  a = value;
  a ??= value; // value가 null이 아니면 a에 value의 값을 대입, null이면 원래 값 유지

  // 논리 연산자
  // !expr: 수식의 원래 값 반대로
  // &&: and(논리곱)
  // ||: or(논리합)

  // 비트, 시프트 연산자
  // &: and
  // |: or
  // ^: xor
  // ~expr: 비트 반전
  // <<: 왼쪽으로 시프트
  // >>: 우측으로 시프트
  // >>>: Unsigned shift right

  // 조건 연산자
  // var 변수 = 조건 ? 값1 : 값2 (3항 연산자)

  String playerName(String? name) => name ?? "Guest";
  // 같은 코드
  // String playerName(String? name) {
  //   if (name != null) {
  //     return name;
  //   }
  //   return "Guest";
  // }


  // Cascade Notation / dart:ui가 Flutter 앱에서만 작동하는 관계로 주석 처리
  // var paint = Paint()
  //   ..color = Colors.black
  //   ..strokeCap = StrokeCap.round
  //   ..strokeWidth = 5.0;

  // 객체가 Null일 경우의 Cascade Notation
  // querySelector('#confirm') // Get an object.
  // ?..text = 'Confirm' // Use its members.
  // ..classes.add('important')
  // ..onClick.listen((e) => window.alert('Confirmed!'))
  // ..scrollIntoView();

  // 전개 연산자
  // 실제 연산자가 아님
  // Iterable한 변수들에 대해 연장 및 추가가 가능함
  var arr1 = [1,2,3], arr2 = [4,5,6];
  var arr3 = [...arr1, ...arr2];

  // 그 외 연산자
  // (): 함수 호출이나 그룹화를 위해 사용
  // []: 리스트 or 맵의 요소에 접근하거나 초기화할 때 사용
  // ?[]: 리스트나 맵이 Null일 수 있는 경우 안전하게 요소를 접근
  // .: 객체의 속성이나 메서드에 접근
  // ?.: 객체가 Null일 가능성이 있을 때 안전하게 속성이나 메서드에 접근
  // !: Null이 아님을 확ㅅㄴ할 때 사용해 값을 가져옴(널이 아님을 보장해야 함)
}