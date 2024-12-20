import "dart:io";

// if (astronauts == 0) {
//   throw StateError("No astronauts.");
// }

Future<void> describeFlybyObjects(List<String> flybyObjects) async {
  // `describeFlybyObjects`는 비동기 함수로, 주어진 객체 리스트 `flybyObjects`에 대해 파일에서 설명을 읽고 출력합니다.
  // 반환 타입은 `Future<void>`이며, 이 함수는 비동기 작업이 완료될 때 반환됩니다.

  try {
    // 예외가 발생할 가능성이 있는 블록을 처리하기 위해 `try`를 사용합니다.

    for (final object in flybyObjects) {
      // `flybyObjects` 리스트의 각 항목을 순회하며 `object` 변수에 할당합니다.

      var description = await File("$object.txt").readAsString();
      // `object` 이름을 사용하여 파일 이름을 생성합니다 (예: "Mars.txt").
      // `File.readAsString()`을 사용하여 해당 파일의 내용을 비동기적으로 읽어옵니다.
      // 결과는 `description` 변수에 저장됩니다.

      print(description);
      // 파일에서 읽은 내용을 출력합니다.
    }
  } 
  on IOException catch (e) {
    // `IOException`이 발생한 경우 예외를 처리합니다.
    // 파일을 읽거나 찾는 중 오류가 발생했을 때 이 블록이 실행됩니다.

    print("Could not describe object: $e");
    // 예외 메시지를 출력하여 어떤 객체에서 오류가 발생했는지 확인합니다.
  } 
  finally {
    // `try` 블록이 완료되거나 `catch` 블록이 실행된 후 항상 실행되는 블록입니다.

    flybyObjects.clear();
    // 리스트의 모든 항목을 제거합니다. 이는 `flybyObjects`가 더 이상 필요하지 않을 때 사용됩니다.
  }
}