/// 메타데이터는 코드에 추가 정보를 주는 용도로 쓰임
/// @로 시작하고 const 생성자를 가진 객체만 사용 가능
/// Dart의 주요 내장 메타데이터는 @Deprecated, @override, @pragma 등이 있음
/// @deprecated도 있음. 하지만 @Deprecated 쓰는 게 나음
/// 사용자 정의 메타데이터도 만들어서 쓸 수 있음

// @Deprecated 예제
class Television {
  /// Use [turnOn] to turn the power on instead.
  @Deprecated('Use turnOn instead') // Deprecated 메타데이터
  void activate() {
    turnOn(); // activate()는 내부적으로 여전히 작동하지만 사용은 권장되지 않음
  }

  /// Turns the TV's power on.
  void turnOn() {} // 새로운 메서드로 권장됨

}

/// @override 예제
class Parent {
  void greet() {
    print('Hello from Parent');
  }
}

class Child extends Parent {
  @override
  void greet() {
    print('Hello from Child');
  }
}

/// @pragma 예제
@pragma('vm:entry-point')
void specialFunction() {
  print('This function is marked as an entry point for the VM.');
}

// 사용자가 직접 메타데이터를 정의할 수 있음
// 예제
class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}

void main() {
// @override 사용 예제
  Parent parent = Parent();
  Parent child = Child();

  parent.greet(); // Hello from Parent
  child.greet();  // Hello from Child

  // @pragma는 런타임이나 VM 설정에 따라 효과가 있음
  specialFunction();

  // 사용자가 정의한 Todo 메타데이터 사용 예제
  @Todo("Dash", "Implement this function")
  void doSomething() {
    print("Do something");
  }
}