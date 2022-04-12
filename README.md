# git checkout [브랜치명]

## 주의: 반드시 작업한 브랜치에서 commit하고 오기

# Error

- MissingPluginException
  - restart 시도 해결 x
  - stop -> 재실행 해결!

## rebuild 와 reload

- reload: Text('sdfdsf') -> Text('h');
- rebuild : state가 변경된 경우

# Widget

- Scaffold

  - 위에서 바로 floatingActionButton을 사용하고 싶다면 `floatingActionButton : FloatingActionButton(~~~~)` : constructor에 변수를 선언해줘야한다
    - 하지만, Column내 children에서 쓰인다면 children는 widget을 바로 사용할 수 있으므로 `FloatingActionButton(~~~~)`

- Container

  - 자식이 없을 경우 할 수 있는 최대한의 공간을 차지한다
  - 자식을 가지게 되면 해당 자식의 크기로 줄어들게 된다.

- SafeWidget

  - 개발자가 보여주고자하는 컨텐츠가 화면 밖으로 빠져나가지 않게 경계를 지정해주는 것
    - Scaffold body에 바로 적용하면 위의 statusbar와 겹치지 않게 해줌

- Center

  - button 위젯 같은 작은 위젯의 경우 상하 좌우 기준으로 정렬해준다.
  - 하지만, Column같은 경우 children의 좌우에 따르지만 상하는 가능한 최대를 차지하므로 Center의 상하 통제권일 없어진다. 이경우 Column내부에서 조정해줘야한다

- Column
  - mainAxisSize: MainAxisSize.min
    - Column위젯이 세로축의 공간을 차지하지 않길 원할 때

## Layout을 코드 확인 및 연습 예제 사이트

[Flutter Layout Cheat Sheet](https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e)

# Deprecated -> change

1. [Flutter 2.0 새로운 Material Buttons](https://seosh817.tistory.com/56)

# git clone 이후 빨간줄이 여러개 보일 시 flutter packages get

= flutter pub get

# 키보드사용시 요소의 영역 침범시 해결

SingleChildView 위젯 사용

- 키보드가 밀고 올라와서 차지한 스크린만큼을 스크린 화면이 스크롤 될 수 있도록 만들어주는 위젯

# ButtonTheme

좀더 편하게 버튼의 크 등을 설정 가능

- MaterialButton 또한 존재

# EelevatedButton style 방법

[How to change background color of Elevated Button in Flutter from function?](https://stackoverflow.com/questions/66835173/how-to-change-background-color-of-elevated-button-in-flutter-from-function)

# TextEditingController의 이용

# 페이지 이동과 snackbar
