import 'package:diyi/global/global.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';

class PolicyScreen extends StatefulWidget {
  @override
  _PolicyScreenState createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  String policy = "";

  @override
  void initState() {
    policy = app.appStaticData.static!["policy"].replaceAll("\\n", "\n");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Үйлчилгээний нөхцөл"),
      backgroundColor: Styles.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
          child: MyText(policy, maxLines: 300),
        ),
      ),
    );
  }
}
