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
          emboss: true,// add
          color: baseColor,
          height: 150,
          width: 150,
          borderRadius: 100,
        ),
      ),);
  }
}