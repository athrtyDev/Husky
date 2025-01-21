import 'package:flutter/material.dart';
import 'package:diyi/global/style.dart';

class MyText extends StatelessWidget {
  final String? text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? letterSpacing;
  final double? height;
  final FontStyle? fontStyle;

  MyText(this.text,
      {this.size = Styles.medium,
      this.fontWeight,
      this.textColor,
      this.decoration,
      this.textAlign,
      this.maxLines,
      this.fontStyle,
      this.letterSpacing,
      this.height});

// size 15
  const MyText.xlarge(this.text,
      {this.fontWeight = Styles.wBold,
      this.textColor,
      this.decoration,
      this.textAlign,
      this.maxLines,
      this.fontStyle,
      this.letterSpacing,
      this.height})
      : this.size = Styles.xlarge;

// size 13
  const MyText.large(this.text,
      {this.fontWeight = Styles.wBold,
      this.textColor,
      this.decoration,
      this.textAlign,
      this.fontStyle,
      this.maxLines,
      this.letterSpacing,
      this.height})
      : this.size = Styles.large;

// size 11
  const MyText.medium(
    this.text, {
    this.fontWeight,
    this.textColor,
    this.decoration,
    this.textAlign,
    this.maxLines,
    this.fontStyle,
    this.letterSpacing,
    this.height,
  }) : this.size = Styles.medium;

// size 9
  MyText.small(
    this.text, {
    this.fontWeight,
    this.textColor,
    this.decoration,
    this.textAlign,
    this.fontStyle,
    this.maxLines,
    this.letterSpacing,
    this.height,
  }) : this.size = Styles.small;

  @override
  Widget build(BuildContext context) => Text(
        this.text == null ? "" : this.text.toString(),
        style: TextStyle(
            fontFamily: 'Mulish',
            fontWeight: this.fontWeight ?? Styles.wSemiBold,
            fontSize: this.size,
            decoration: this.decoration ?? TextDecoration.none,
            color: textColor ?? Styles.textColor,
            letterSpacing: letterSpacing,
            fontStyle: fontStyle,
            height: height ?? 1.4),
        textAlign: textAlign ?? TextAlign.start,
        maxLines: this.maxLines ?? 50,
        overflow: TextOverflow.ellipsis,
      );
}
