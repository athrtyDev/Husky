import 'package:diyi/global/style.dart';
import 'package:diyi/providers/tts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoiceIcon extends StatelessWidget {
  final bool isWhite;
  const VoiceIcon({Key key, this.isWhite = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<TtsProvider>(context, listen: true).isSlow
        ? Image.asset("assets/icons/ic_turtle.png", height: 33, width: 33)
        : Icon(
            Icons.record_voice_over_rounded,
            color: isWhite ? Styles.whiteColor : Styles.baseColor,
          );
  }
}
