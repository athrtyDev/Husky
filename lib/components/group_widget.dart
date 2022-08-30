import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';

class GroupWidget extends StatelessWidget {
  final String name;
  final int total;
  final int studied;
  final bool isPaid;

  const GroupWidget({this.name, this.total, this.studied, this.isPaid = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(6),
            padding: EdgeInsets.all(15),
            decoration: Styles.myBoxDecoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      child: MyText.medium(
                        name,
                        textColor: isPaid ? Styles.textColor : Styles.textColor50,
                        fontWeight: Styles.wBold,
                      ),
                    ),
                    if (!isPaid)
                      Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Icon(
                          Icons.lock,
                          color: Styles.textColor30,
                        ),
                      )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: isPaid ? Styles.baseColor : Styles.baseColor70, borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: MyText.medium(
                    "$studied/$total",
                    textColor: Styles.whiteColor,
                    fontWeight: Styles.wBold,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
