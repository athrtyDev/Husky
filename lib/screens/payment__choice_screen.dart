import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/providers/user_provider.dart';
import 'package:diyi/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentChoiceScreen extends StatefulWidget {
  const PaymentChoiceScreen({Key key}) : super(key: key);

  @override
  _PaymentChoiceScreenState createState() => _PaymentChoiceScreenState();
}

class _PaymentChoiceScreenState extends State<PaymentChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Төлбөр төлөх"),
      backgroundColor: Styles.greyColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 30, 40, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.large("Basic"),
            SizedBox(height: 10),
            MyText.medium(
              "Анхан шатны энэхүү багцад бүх HSK түвшний үг багтсан. Дүрэм, дасгал зэрэг бусад үйлчилгээ багтаагүй болно.",
              textColor: Styles.textColor70,
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/payment_screen', arguments: {'type': 'basic'});
              },
              child: Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Styles.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Styles.baseColor, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Styles.baseColor20,
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 5),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyText.large('1 сарын эрх', fontWeight: Styles.wNormal),
                        SizedBox(height: 5),
                        MyText.xlarge(Formatter.moneyFormatter(app.appStaticData.static["payment_basic_amount"]),
                            textColor: Styles.baseColor, fontWeight: Styles.wBold),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_right, color: Styles.baseColor.withOpacity(0.7)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 60),
            MyText.large("Advanced"),
            SizedBox(height: 10),
            MyText.medium(
              "HSK 6 түвшний үг, дүрэм, дасгал, мэдээлэл гэх мэт аппликэйшны бүх үйлчилгээний эрх нээгдэнэ.",
              textColor: Styles.textColor70,
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/payment_screen', arguments: {'type': 'advanced'});
              },
              child: Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Styles.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Styles.baseColor, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Styles.baseColor20,
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 5),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyText.large('1 сарын эрх', fontWeight: Styles.wNormal),
                        SizedBox(height: 5),
                        MyText.xlarge(Formatter.moneyFormatter(app.appStaticData.static["payment_advanced_amount"]),
                            textColor: Styles.baseColor, fontWeight: Styles.wBold),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_right, color: Styles.baseColor.withOpacity(0.7)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentTile(String name, IconData icon) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 50,
      decoration: BoxDecoration(
        color: Styles.baseColor20,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText.medium(name, textColor: Styles.textColor70),
          Icon(
            icon,
            color: Styles.textColor30,
            size: 15,
          ),
        ],
      ),
    );
  }
}
