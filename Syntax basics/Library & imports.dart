// 내장 라이브러리 사용하기
import "dart:html"; // 세미콜론 찍어야 함

// package: Pub 패키지 관리자를 통해 제공되는 외부 패키지 라이브러리
// import 'package:test/test.dart'; // Pub 패키지를 가져오는 예시(파일이 없으므로 주석 처리)

import "package:lib1/lib1.dart"; // lib1 가져오기
import "package:lib2/lib2.dart" as lib2; // lib2에 접두사 지정

// lib1의 Element 클래스 사용
Element element1 = Element();

// lib2의 Element 클래스 사용
lib2.Element element2 = lib2.Element();

// 라이브러리 전체가 아닌 일부만 가져오기
import "package:lib1/lib1.dart" show foo; // foo만 가져오기
import "package:lib2/lib2.dart" hide foo; // foo를 제외하고 가져오기

// 라이브러리 지연 로딩
import "package:greetings/hello.dart" deferred as hello; // hello를 지연 로딩으로 가져오기

Future<void> greet() async {
  await hello.loadLibrary(); // 라이브러리를 로드
  hello.printGreeting(); // 로드된 라이브러리의 함수 호출
}

// 라이브러리 선언
// 라이브러리 수준의 주석이나 메타데이터를 지정하려면 파일의 시작 부분에서 선언
/// 브라우저에서 실행되는 테스트 라이브러리
@TestOn("browser")
library; // 라이브러리 선언