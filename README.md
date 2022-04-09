# BuildContext

widget tree에서 현재 widget의 위치를 알 수 있는 정보

- 모든 위젯을 자신만의 BuildContext 가지고 있고, BuildContext은 stateless위젯이나 state 빌드 메서드에 의해서 리턴된 위젯의 부모가 된다.
- BuildContext는 class / context는 BuildContext class의 instance

## context는 위젯 간의 정보전달이다!

# 스냅바

scaffold body 부분에서 flatbutton(-> textbutton) / raised button / floading action button 을 자주 사용할 것

- 세개의 기능은 비슷

## ref

[SnackBar class](https://api.flutter.dev/flutter/material/SnackBar-class.html)

1. ScaffoldMessenger.of(context)를 참조하여 scaffold 위치를 참조한 후
2. showSnackBar 메소드 내부에서 스낵바를 구현해야한다.

# scaffold.of()

현재 주어진 context에서 위로 올라가면서 가장 가까운 scaffold를 찾아서 반환하라

- 삭제됨

## Builder위젯

[Builder class](https://api.flutter.dev/flutter/widgets/Builder-class.html)

# 괄호와 컴마 정리 방법🧐

vscode file -> preference -> keyboard shortcut -> input format -> format document 키 확인

- shift + alt + f

# 위젯트리의 정보가 바뀔때마다 hot loading x -> Restart하기!
