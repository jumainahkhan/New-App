import 'package:flutter/material.dart';

class MySquareTile extends StatelessWidget {
  final String imagePAth;
  const MySquareTile({super.key, required this.imagePAth});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        child: Image.asset(imagePAth),
      ),
    );
  }
}
