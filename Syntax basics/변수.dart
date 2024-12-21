// 간략한 변수 선언 예제
var varName = "Bob";

// 하나의 타입으로 제한받지 않도록 하는 방법
Object objectName = "Bob";

// 정확히 추론되는 타입으로 정의하기
String stringName = "Bob";

// Null이 포함되는 자료형
String? nullName = null;

// late 변수
// 1. 선언 후 나중에 초기화하는 Non-Nullable 변수
// 2. 변수를 필요한 순간에만 초기화하도록 지연 초기화
late String description;

// final 변수
// final 변수는 값을 바꿀 수 없음
final finalName = "Bob";
// finalName = "Alice";  Error: a final variable can only be set once.
final String finalNickname = "Bobby";

// const 변수
// const 변수는 컴파일 시간에 생성되는 상수이다.
const bar = 1000000; 
const double atm = 1.01325 * bar;

// const는 변수에만 해당하는 것이 아님. const 값도 존재함
var foo = const []; // 변수 재할당 가능 but 리스트 내용 변경 불가능
final box = const []; // 변수 재할당 불가능 and 리스트 내용 변경 불가능
const bax = []; // 변수 재할당 불가능 but 리스트 내용 변경 불가능

void main() {
  // 지역 변수를 선언할 때는 값을 초기화 하지 않아도 되지만
  // 사용하기 전에는 값을 초기화 해야 한다.
  int count;
  // print(count);  Error: Non-nullable variable 'count' must be assigned before it can be used.
  count = 1;
  print(count); 
}