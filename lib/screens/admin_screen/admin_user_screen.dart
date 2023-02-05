import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/global/global.dart';
import 'package:flutter/material.dart';

class AdminUserScreen extends StatefulWidget {
  const AdminUserScreen({Key key}) : super(key: key);

  @override
  _AdminUserScreenState createState() => _AdminUserScreenState();
}

class _AdminUserScreenState extends State<AdminUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Хэрэглэгчид"),
      backgroundColor: Styles.whiteColor,
    );
  }
}
