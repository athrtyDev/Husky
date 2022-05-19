import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';
import 'package:flutter/material.dart';

class MyToast extends StatelessWidget {
  final String title;
  final String body;
  final Color color;
  final Function callback;

  MyToast({Key key, this.title, this.body, this.color, this.callback}) : super(key: key);
  MyToast.errorToast({this.body, this.title, this.callback}) : color = Styles.orangeColor;
  MyToast.warningToast({this.body, this.title, this.callback}) : color = Styles.yellowColor;
  MyToast.successToast({this.body, this.title, this.callback}) : color = Styles.greenColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight * 2,
      left: MediaQuery.of(context).size.width * 10,
      child: InkWell(
        onTap: () {
          callback();
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 80,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color ?? Styles.yellowColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: MyText.large(
                    title != null ? title : "",
                    fontWeight: Styles.wBold,
                    textColor: Styles.whiteColor,
                  )),
                  Icon(
                    Icons.close,
                    color: Styles.whiteColor,
                    size: 20,
                  )
                ],
              ),
              if (body != null)
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: 1,
                  color: Styles.whiteColor10,
                ),
              if (body != null)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: MyText.medium(
                    body,
                    fontWeight: Styles.wNormal,
                    textColor: Styles.whiteColor,
                    height: 1.3,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
