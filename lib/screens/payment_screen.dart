import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/providers/user_provider.dart';
import 'package:diyi/utils/base_functions.dart';
import 'package:diyi/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  final dynamic args;
  const PaymentScreen({Key? key, this.args}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late String amount;

  @override
  void initState() {
    super.initState();
    amount = widget.args['type'] == "basic"
        ? Formatter.moneyFormatter(app.appStaticData!.static!["payment_basic_amount"])
        : Formatter.moneyFormatter(app.appStaticData!.static!["payment_advanced_amount"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Төлбөр төлөх"),
      backgroundColor: Styles.greyColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.large("Заавар"),
            SizedBox(height: 10),
            MyText.medium(
              app.appStaticData!.static!["payment_instruction"] ??
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
                  paymentTile(app.appStaticData!.static!["bank_name"] ?? "", Icons.copy),
                  SizedBox(height: 25),
                  MyText.medium('Дансны дугаар'),
                  SizedBox(height: 10),
                  paymentTile(app.appStaticData!.static!["bank_account"] ?? "", Icons.copy),
                  SizedBox(height: 25),
                  MyText.medium('Дансны нэр'),
                  SizedBox(height: 10),
                  paymentTile(app.appStaticData!.static!["bank_account_name"] ?? "", Icons.copy),
                  SizedBox(height: 25),
                  MyText.medium('Төлөх дүн'),
                  SizedBox(height: 10),
                  paymentTile(amount, Icons.copy),
                  SizedBox(height: 25),
                  MyText.medium('Гүйлгээний утга'),
                  SizedBox(height: 10),
                  paymentTile(Provider.of<UserProvider>(context, listen: false).loggedUser!.shortId.toString(), Icons.copy),
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
    return InkWell(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: name));
        showSuccessToasts("Амжилттай хууллаа");
        // copied successfully
      },
      child: Container(
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
      ),
    );
  }
}
