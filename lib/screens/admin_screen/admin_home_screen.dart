import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key key}) : super(key: key);

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(title: "Админ тохиргоо"),
        backgroundColor: Styles.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                setting("Хэрэглэгчид", () {
                  Navigator.pushNamed(context, '/admin_user_screen');
                }),
                setting("Төлбөр заавар", () {
                  Navigator.pushNamed(context, '/admin_edit_screen', arguments: {
                    'type': 'payment_instruction',
                    'title': 'Төлбөр заавар',
                  });
                }),
                setting("Төлбөр банкны нэр", () {
                  Navigator.pushNamed(context, '/admin_edit_screen', arguments: {
                    'type': 'bank_name',
                    'title': 'Төлбөр банкны нэр',
                  });
                }),
                setting("Төлбөр данс дугаар", () {
                  Navigator.pushNamed(context, '/admin_edit_screen', arguments: {
                    'type': 'bank_account',
                    'title': 'Төлбөр данс дугаар',
                  });
                }),
                setting("Төлбөр дансны нэр", () {
                  Navigator.pushNamed(context, '/admin_edit_screen', arguments: {
                    'type': 'bank_account_name',
                    'title': 'Төлбөр дансны нэр',
                  });
                }),
                setting("Basic үнэ", () {
                  Navigator.pushNamed(context, '/admin_edit_screen', arguments: {
                    'type': 'payment_basic_amount',
                    'title': 'Basic үнэ',
                  });
                }),
                setting("Advanced үнэ", () {
                  Navigator.pushNamed(context, '/admin_edit_screen', arguments: {
                    'type': 'payment_advanced_amount',
                    'title': 'Advanced үнэ',
                  });
                }),
                setting("Баннер", () {
                  Navigator.pushNamed(context, '/admin_edit_screen', arguments: {
                    'type': 'banner',
                    'title': 'Баннер',
                  });
                }),
                setting("Холбоо барих", () {
                  Navigator.pushNamed(context, '/admin_edit_screen', arguments: {
                    'type': 'contact',
                    'title': 'Холбоо барих',
                  });
                }),
              ],
            ),
          ),
        ));
  }

  Widget setting(String title, Function onTap) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 55,
        padding: EdgeInsets.symmetric(horizontal: 25),
        margin: EdgeInsets.only(bottom: 15),
        decoration: Styles.myBoxDecoration,
        child: Row(
          children: [
            Container(
              width: 8,
              decoration: BoxDecoration(
                border: Border.all(color: Styles.baseColor70, width: 2),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 10),
            MyText(title),
            Expanded(child: SizedBox()),
            Icon(
              Icons.chevron_right,
              color: Styles.baseColor,
            ),
          ],
        ),
      ),
    );
  }
}
