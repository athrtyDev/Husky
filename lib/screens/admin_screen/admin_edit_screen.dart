import 'package:diyi/components/button.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/core/api.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/utils/base_functions.dart';
import 'package:flutter/material.dart';

class AdminEditScreen extends StatefulWidget {
  final dynamic args;
  const AdminEditScreen({Key key, this.args}) : super(key: key);

  @override
  _AdminEditScreenState createState() => _AdminEditScreenState();
}

class _AdminEditScreenState extends State<AdminEditScreen> {
  String type;
  String title;
  TextEditingController controller = TextEditingController();
  FocusNode focus = FocusNode();

  @override
  void initState() {
    super.initState();
    type = widget.args['type'];
    title = widget.args['title'];
    controller.text = app.appStaticData.static[type] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: title),
      backgroundColor: Styles.whiteColor,
      body: InkWell(
        onTap: () {
          focus.unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.large(title),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Styles.textColor50),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextField(
                    controller: controller,
                    focusNode: focus,
                    maxLines: 8,
                    decoration: InputDecoration.collapsed(
                      hintText: "$title бичнэ үү...",
                      fillColor: Styles.greyColor,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Button(
                  text: "Хадгалах",
                  onClick: () {
                    if (controller.text == "") {
                      showWarningToasts("Хоосон байна");
                    } else {
                      app.appStaticData.static[type] = controller.text;
                      Api api = Api();
                      api.changeStaticData(app.appStaticData.static);
                      Navigator.of(context).pop();
                    }
                  },
                ),
                SizedBox(height: 400),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
