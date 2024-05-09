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