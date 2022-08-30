import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Төлбөр"),
      backgroundColor: Styles.greyColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.large("Заавар"),
            SizedBox(height: 10),
            MyText.medium(
              "Төлбөр төлөхдөө доорх данс руу шилжүүлэх ба гүйлгээний утгыг зөв оруулахыг анхаарна уу.",
              textColor: Styles.textColor70,
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Styles.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText.medium('Банк'),
                  SizedBox(height: 10),
                  paymentTile("Хаан банк", Icons.copy),
                  SizedBox(height: 25),
                  MyText.medium('Дансны дугаар'),
                  SizedBox(height: 10),
                  paymentTile("1234 5678 9123", Icons.copy),
                  SizedBox(height: 25),
                  MyText.medium('Дансны нэр'),
                  SizedBox(height: 10),
                  paymentTile("Гантулга Дэлгэрэх", Icons.copy),
                  SizedBox(height: 25),
                  MyText.medium('Төлөх дүн'),
                  SizedBox(height: 10),
                  paymentTile("20'000₮", Icons.copy),
                  SizedBox(height: 25),
                  MyText.medium('Гүйлгээний утга'),
                  SizedBox(height: 10),
                  paymentTile("U123456", Icons.copy),
                  SizedBox(height: 10),
                ],
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
