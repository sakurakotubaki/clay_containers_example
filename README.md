# clay_containers_example

## Example
シンプルな粘土の容器
最良の結果を得るには、周囲のウィジェットの背景色を、粘土コンテナに設定する色と一致するように設定します。この基本色を複数回再利用する可能性が高いため (特に、何か派手なことをする場合には)、この色を 1 つの値に設定することをお勧めします。次の例では、baseColor に設定されています。

立体的な正方形
```dart
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class MyExampleScreen extends StatelessWidget {
  const MyExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xFFF2F2F2);

    return Container(
        color: baseColor,
        child: Center(
          child: ClayContainer(
            color: baseColor,
            height: 200,
            width: 200,
          ),
        ),
      );
  }
}
```

## ClayContainer with a ClayText Child. 
前の例では、ClayContainer には子がないため、高さと幅が指定されています。 ClayContainer は通常の Container と同じように動作し、高さと幅を指定するか、子を表示する必要があります。次の例では、ClayContainer が子を受け取ります。

受け取る子は、何らかの Padding でラップされた ClayText です。
```dart
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class MyExampleScreen extends StatelessWidget {
  const MyExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xFFF2F2F2);

    return Container(
        color: baseColor,
        child: Center(
          child: ClayContainer(
          color: baseColor,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ClayText("Seize the Clay!", emboss: true, size: 40),
          ),
        ),
        ),
      );
  }
}
```

### Rounded ClayContainers 
四角くならないでください！ borderRadius を使用してフレアを追加します。均一な borderRadius が必要な場合は、ClayContainer コンストラクターで直接設定するだけです。

公式のサンプルは、borderRadiusが５０だったが、１００にしないと丸にならなかった😅
```dart
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class MyExampleScreen extends StatelessWidget {
  const MyExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xFFF2F2F2);

    return Container(
        color: baseColor,
        child: Center(
          child: ClayContainer(
          color: baseColor,
          height: 150,
          width: 150,
          borderRadius: 100,
        ),
      ),);
  }
}
```

## 自作した凹んだWidget
このコードでは、BoxDecorationとBoxShadowを使って、ClayContainerのemboss効果を再現しています。BoxShadowは2つ定義されており、一つは灰色の影で、もう一つは白色の影です。これにより、凹んだ効果が生まれます。

```dart
import 'package:flutter/material.dart';

class ShowContainer extends StatelessWidget {
  const ShowContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xFFF2F2F2);

    return Container(
      color: baseColor,
      child: Center(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(-3, -3), // changes position of shadow
              ),
              const BoxShadow(
                color: Colors.white,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(3, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 立体的なフォームを作る
同じように立体的な入力フォームを作ることもできます。

```dart
import 'package:flutter/material.dart';

class BoxShowForm extends StatelessWidget {
  const BoxShowForm({super.key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color(0xFFF2F2F2);

    return Container(
      color: baseColor,
      child: Center(
        child: Container(
          height: 60,
          width: 300,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(-3, -3), // changes position of shadow
              ),
              const BoxShadow(
                color: Colors.white,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(3, 3), // changes position of shadow
              ),
            ],
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
      ),
    );
  }
}
```

このコードでは、TextFieldウィジェットをContainerウィジェットの中に配置し、Containerウィジェットに影をつけることで凹んだ効果を作り出しています。また、TextFieldのdecorationプロパティを使って、入力フォームの内側の余白を調整しています。