import 'package:flutter/material.dart';
import 'package:diyi/global/style.dart';

class ProgressBar extends StatelessWidget {
  final int total;
  final int done;
  final double width;
  final double height;

  const ProgressBar({@required this.total, @required this.done, @required this.width, this.height = 15});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Styles.baseColor.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        Container(
          height: height,
          width: width * done / total,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ],
    );
  }
}
