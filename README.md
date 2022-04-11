# StatefulWidget이 rebuild되는 경우

1. statelessWidget처럼 자식위젯의 생성자를 통해서 데이터가 전달 될 때
2. Internal state가 바뀔 때

# StatefulWidget이 두개의 클래스로 이뤄져 있는 이유

Widget클래스를 상속하고 있고 기본적으로 한번 생성되면 state가 변하지 않아 immutable합니다

- 따라서, 단순히 StatefulWidget을 상속한다면 StatefulWidget일 수도 있고 Statelesswidget일 수도 있다
- 하지만 StatefulWidget은 반드시 state의 변화를 반영해야기 때문에 두개의 클래스로 나뉘어
  - extends StatefulWidget : immutable한 특징 유지
  - extends State : mmutable한 속성 대신한다
- 위 두가지를 연결해야한다.
  - State의 generic type을 StatefulWidget을 상속한 클래스로 두어 연결시킨다.

# Text위젯과 같이 StatelessWidget이 출력을 담당한다면

StatelessWidget을 반드시 build method를 호출해서 위젯을 rebuild하는 방법밖에 없다

- 단순히 floatingActionButton을 누른다고 build method를 호출할 수 없다.
  - 우리 대신, build method를 호출해줄 수 있는 setState method를 사용한다.

# setState

- 역할

  1. 매게변수로 전달된 함수를 호출한다.
  2. build method를 호출한다
