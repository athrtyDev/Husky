import 'package:flutter/material.dart';

class LoaderDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: CircularProgressIndicator(),
        // Image.asset(
        //   AssetsIcons.icLoader,
        //   height: 40,
        //   width: 40,
        // ),
      )
    ]);
  }
}
