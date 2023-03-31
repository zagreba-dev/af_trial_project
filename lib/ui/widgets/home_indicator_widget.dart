import 'package:flutter/material.dart';

class HomeIndicatorWidget extends StatelessWidget {
  const HomeIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134,
      height: 5,
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
