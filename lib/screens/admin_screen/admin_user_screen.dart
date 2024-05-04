import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/core/classes/UserData.dart';
import 'package:diyi/global/constants.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/providers/user_provider.dart';
import 'package:diyi/utils/bouncer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminUserScreen extends StatefulWidget {
  const AdminUserScreen({Key? key}) : super(key: key);

  @override
  _AdminUserScreenState createState() => _AdminUserScreenState();
}

class _AdminUserScreenState extends State<AdminUserScreen> {
  TextEditingController controller = TextEditingController();
  FocusNode focus = FocusNode();
  final debouncer = Debouncer(milliseconds: 900);

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 360), () {
      Provider.of<UserProvider>(context, listen: false).clearSearchedUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Хэрэглэгчид"),
      backgroundColor: Styles.whiteColor,
      body: InkWell(
        onTap: () => focus.unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                color: Styles.greyColor,
                padding: EdgeInsets.all(10),
                alignment: Alignment(-1, 0),
                child: TextField(
                  controller: controller,
                  focusNode: focus,
                  maxLines: 8,
                  decoration: InputDecoration.collapsed(
                    hintText: "Код;код;код...",
                    fillColor: Styles.greenColor,
                  ),
                  onChanged: (text) {
                    debouncer.run(() {
                      Provider.of<UserProvider>(context, listen: false).fetchUsersByShortId(text);
                    });
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      if (Provider.of<UserProvider>(context, listen: true).listSearchedUser != null &&
                          Provider.of<UserProvider>(context, listen: true).listSearchedUser!.isNotEmpty)
                        for (var user in Provider.of<UserProvider>(context, listen: true).listSearchedUser!)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: userTile(user),
                          ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget userTile(UserData user) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: Styles.myBoxDecoration,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(user.name ?? user.shortId.toString()),
              MyText(user.shortId.toString(), textColor: Styles.textColor70),
              // MyText(user.paymentEndDate == "" ? "" : user.paymentEndDate.substring(0, 10), textColor: Styles.textColor70),
            ],
          ),
          SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         MyText(user.name),
          //         SizedBox(height: 5),
          //         MyText(user.shortId.toString(), textColor: Styles.textColor70),
          //       ],
          //     ),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: [
          //         MyText(user.paymentEndDate == "" ? "" : user.paymentEndDate.substring(0, 10), textColor: Styles.textColor70),
          //         SizedBox(height: 5),
          //         payButton(
          //           user.paidStatus == "" ? "New" : user.paidStatus,
          //           () {},
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              payButton(
                user.paidStatus! == "" ? "New" : user.paidStatus!,
                user.paidStatus == ""
                    ? Styles.baseColor20
                    : user.paidStatus == PaidType.advanced
                        ? Styles.greenColor
                        : user.paidStatus == PaidType.basic
                            ? Styles.yellowColor
                            : Styles.baseColor,
                () {
                  setState(() {
                    if (user.paidStatus == "" || user.paidStatus == PaidType.advanced) {
                      user.paidStatus = PaidType.basic;
                    } else if (user.paidStatus == PaidType.basic) {
                      user.paidStatus = PaidType.advanced;
                    }
                    DateTime paymentDate = DateTime.now().add(Duration(days: 30));
                    user.paymentEndDate = paymentDate.toString();
                  });
                  Provider.of<UserProvider>(context, listen: false).changeUserPaidStatus(user);
                },
              ),
              InkWell(
                onTap: () async {
                  showDateSelection(user);
                },
                child: Container(
                  height: 40,
                  alignment: Alignment(0, 0),
                  child:
                      MyText(user.paymentEndDate == "" ? "" : user.paymentEndDate!.substring(0, 10), textColor: Styles.textColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  showDateSelection(UserData user) async {
    DateTime selectedDate =
        user.paymentEndDate == "" ? DateTime.now() : DateTime.tryParse(user.paymentEndDate!) ?? DateTime.now();
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (BuildContext bc) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                child: CupertinoDatePicker(
                  initialDateTime: selectedDate,
                  onDateTimeChanged: (DateTime newdate) {
                    selectedDate = newdate;
                  },
                  use24hFormat: true,
                  maximumDate: DateTime.now().add(Duration(days: 365 * 100)),
                  minimumYear: DateTime.now().year,
                  maximumYear: 2100,
                  minuteInterval: 1,
                  mode: CupertinoDatePickerMode.date,
                  dateOrder: DatePickerDateOrder.ymd,
                ),
              ),
            ],
          );
        });
    setState(() {
      user.paymentEndDate = selectedDate.toString();
    });
    Provider.of<UserProvider>(context, listen: false).changeUserPaidStatus(user);
  }

  Widget payButton(String text, Color color, Function onClick) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                MyText.medium(
                  text,
                  textAlign: TextAlign.center,
                  fontWeight: Styles.wBold,
                  textColor: Styles.whiteColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
