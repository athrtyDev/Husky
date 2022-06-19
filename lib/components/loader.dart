import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/images/loader.gif",
        height: 70,
      ),
    );
  }
}
