import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';

class Button extends StatelessWidget {
  final double? width;
  final String? text;
  final Function? onClick;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? buttonColor;
  late Color textColor;
  final IconData? icon;
  final Border? border;
  final Widget? iconSvg;
  final bool? hasShadow;
  final double? height;

  Button({
    Key? key,
    this.width,
    this.text = '',
    this.onClick,
    this.padding,
    this.margin,
    this.height,
    this.icon,
    this.iconSvg,
    Null Function()? handleClear,
  })  : buttonColor = Styles.baseColor,
        textColor = Styles.whiteColor,
        border = Border.all(width: 0, color: Colors.transparent),
        hasShadow = true;

  Button.disabled({
    Key? key,
    this.width,
    this.text = '',
    this.onClick,
    this.padding,
    this.margin,
    this.height,
    this.icon,
    this.iconSvg,
    Null Function()? handleClear,
  })  : buttonColor = Styles.baseColor.withOpacity(0.3),
        textColor = Styles.whiteColor,
        border = Border.all(width: 0, color: Colors.transparent),
        hasShadow = false;

  Button.secondary({
    Key? key,
    this.width,
    this.text = '',
    this.onClick,
    this.padding,
    this.margin,
    this.height,
    this.icon,
    this.iconSvg,
    Null Function()? handleClear,
  })  : buttonColor = Styles.textColor30,
        textColor = Styles.whiteColor,
        border = Border.all(width: 0, color: Colors.transparent),
        hasShadow = false;

  Button.accent({
    Key? key,
    this.width,
    this.text = '',
    this.onClick,
    this.padding,
    this.margin,
    this.height,
    this.icon,
    this.iconSvg,
    Null Function()? handleClear,
  })  : buttonColor = Styles.orangeColor,
        textColor = Styles.whiteColor,
        border = Border.all(width: 0, color: Colors.transparent),
        hasShadow = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick == null ? () {} : onClick!(),
      child: Container(
        height: height ?? 55,
        margin: margin ?? EdgeInsets.zero,
        padding: padding ?? EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: buttonColor,
            border: border,
            borderRadius: BorderRadius.circular(5),
            boxShadow: hasShadow!
                ? [
                    BoxShadow(
                      color: buttonColor!.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ]
                : null),
        width: width ?? null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                if (icon != null)
                  Container(
                    child: Icon(icon, color: textColor),
                    padding: EdgeInsets.only(right: 2),
                  ),
                if (iconSvg != null)
                  Container(
                    height: 10,
                    child: iconSvg,
                    padding: EdgeInsets.only(right: 3),
                  ),
                MyText.medium(
                  text ?? "",
                  textAlign: TextAlign.center,
                  fontWeight: Styles.wBold,
                  textColor: textColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
