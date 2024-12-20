import '클래스.dart';
import 'dart:io';   // File을 위한 모듈

const oneSec = Duration(seconds: 1);

Future<void> printWIthDelay(String msg) async {
  await Future.delayed(oneSec);
  print(msg);
}

// 위 메소드는 다음과 같음
// Future<void> printWithDelay(String message) {
//   return Future.delayed(oneSec).then((_) {
//     print(message);
//   });
// }

Future<void> createDescriptions(Iterable<String> objects) async {
  // `createDescriptions` 함수는 비동기 함수로, 여러 문자열 객체의 파일을 생성하고 내용을 쓰는 작업을 수행합니다.
  // 반환 타입은 `Future<void>`로, 작업이 완료될 때 반환합니다.
  
  for (final object in objects) {
    // `objects` 컬렉션의 각 항목을 순회하면서 `object` 변수에 할당합니다.
    // 각 항목은 파일 이름으로 사용됩니다.
    
    try {
      // 예외 발생 가능성이 있는 코드 블록을 시도합니다.
      
      var file = File('$object.txt');
      // 각 객체 이름에 `.txt`를 붙여 파일 경로를 생성하고, `File` 객체를 만듭니다.
      
      if (await file.exists()) {
        // 파일이 이미 존재하는지 비동기적으로 확인합니다.
        
        var modified = await file.lastModified();
        // 파일의 마지막 수정 시간을 비동기적으로 가져옵니다.
        
        print('File for $object already exists. It was modified on $modified.');
        // 파일이 이미 존재하면, 파일 이름과 마지막 수정 시간을 출력합니다.
        
        continue;
        // 현재 루프를 종료하고 다음 객체로 이동합니다.
      }
      
      await file.create();
      // 파일이 존재하지 않을 경우 새로 생성합니다. 이는 비동기 작업입니다.
      
      await file.writeAsString('Start describing $object in this file.');
      // 파일에 `object`에 대한 설명을 텍스트로 씁니다. 이는 비동기 작업입니다.
      
    } on IOException catch (e) {
      // `IOException`이 발생한 경우 예외를 처리합니다.
      
      print('Cannot create description for $object: $e');
      // 예외가 발생한 객체 이름과 에러 메시지를 출력합니다.
    }
  }
}

Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  // `report` 함수는 비동기 스트림(`Stream<String>`)을 반환하는 제너레이터 함수입니다.
  // `async*`는 스트림 데이터를 순차적으로 내보낼 때 사용됩니다.
  // 파라미터:
  // - `craft`: `Spacecraft` 객체로, 우주선 정보를 나타냅니다.
  // - `objects`: 문자열의 반복 가능한 컬렉션으로, 우주선이 지나가는 대상들입니다.

  for (final object in objects) {
    // `objects` 컬렉션의 각 항목을 순회하며 `object` 변수에 할당합니다.

    await Future.delayed(oneSec);
    // 1초간 비동기적으로 대기합니다. `Future.delayed`를 사용하여 딜레이를 구현합니다.
    // 이 코드는 각 객체에 대한 보고를 지연시켜 순차적으로 발생시키는 역할을 합니다.

    yield '${craft.name} flies by $object';
    // `yield`는 스트림에 데이터를 내보냅니다.
    // 여기서는 우주선 이름(`craft.name`)과 대상 이름(`object`)을 포함한 문자열을 반환합니다.
  }
}