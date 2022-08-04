import 'package:diyi/global/style.dart';
import 'package:diyi/providers/tts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Widget> TtsSpeedIcon(BuildContext context) {
  return [
    Provider.of<TtsProvider>(context, listen: true).isSlow
        ? InkWell(
            onTap: () {
              Provider.of<TtsProvider>(context, listen: false).switchSpeed();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Styles.baseColor20,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "assets/icons/ic_turtle.png",
                height: 33,
                width: 33,
              ),
            ),
          )
        : InkWell(
            onTap: () {
              Provider.of<TtsProvider>(context, listen: false).switchSpeed();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              foregroundDecoration: BoxDecoration(
                color: Colors.grey[50],
                backgroundBlendMode: BlendMode.saturation,
              ),
              child: Opacity(
                opacity: 0.7,
                child: Image.asset("assets/icons/ic_turtle.png", height: 33, width: 33),
              ),
            ),
          ),
    SizedBox(width: 20),
  ];
}
