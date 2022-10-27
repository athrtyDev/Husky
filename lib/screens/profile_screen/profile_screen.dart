import 'package:cached_network_image/cached_network_image.dart';
import 'package:diyi/components/button.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/constants.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/providers/user_provider.dart';
import 'package:diyi/providers/vocabulary_practice_provider.dart';
import 'package:diyi/screens/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () async {
    //   await Provider.of<UserProvider>(context, listen: false).logout();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<User>() == null
        ? LoginScreen()
        : Provider.of<UserProvider>(context, listen: true).loggedUser == null
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.only(top: kToolbarHeight + 20, left: 20, right: 20),
                child: Column(
                  children: [
                    _profileWidget(),
                    Expanded(child: SizedBox()),
                    _hskLevelWidget(),
                    Expanded(child: SizedBox()),
                    _listSettingWidget(),
                    Expanded(child: SizedBox()),
                    Button.secondary(
                      text: "Гарах",
                      onClick: () {
                        Provider.of<UserProvider>(context, listen: false).logout();
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              );
  }

  _profileWidget() {
    User user = Provider.of<UserProvider>(context, listen: false).firebaseUser;
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Styles.greyColor,
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: user.photoURL,
              height: 70,
              width: 70,
            ),
          ),
        ),
        SizedBox(width: 25),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.large(
                user.displayName,
                fontWeight: Styles.wSemiBold,
              ),
              MyText(
                user.metadata.creationTime.toString().substring(0, 10),
                fontWeight: Styles.wSemiBold,
                textColor: Styles.textColor50,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _hskLevelWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText("Түвшин солих", textColor: Styles.textColor70),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _hskWidget(Hsk.hsk1),
              _hskWidget(Hsk.hsk2),
              _hskWidget(Hsk.hsk3),
              _hskWidget(Hsk.hsk4),
              _hskWidget(Hsk.hsk5),
              _hskWidget(Hsk.hsk6),
            ],
          ),
        ),
      ],
    );
  }

  _listSettingWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText("Тохиргоо", textColor: Styles.textColor70),
        SizedBox(height: 10),
        _settingsTile(
            title: "Төлбөр төлөх",
            icon: Icons.credit_card_rounded,
            onTap: () {
              Navigator.pushNamed(context, '/payment_screen');
            }),
        _separator(),
        _settingsTile(
            title: "Санал хүсэлт",
            icon: Icons.note_add,
            onTap: () {
              print('aaa');
            }),
        _separator(),
        _settingsTile(
            title: "Холбоо барих",
            icon: Icons.phone,
            onTap: () {
              print('aaa');
            }),
      ],
    );
  }

  _settingsTile({String title, IconData icon, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Styles.yellowColor.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Styles.whiteColor),
            ),
            SizedBox(width: 20),
            MyText.large(title),
            Expanded(child: SizedBox()),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Styles.textColor50,
              size: 15,
            )
          ],
        ),
      ),
    );
  }

  _separator() {
    return Container(width: MediaQuery.of(context).size.width, height: 0.3, color: Styles.textColor30);
  }

  _hskWidget(String hsk) {
    return InkWell(
      onTap: () {
        Provider.of<UserProvider>(context, listen: false).setHsk(hsk);
        Provider.of<PracticeProvider>(context, listen: false).clearPracticeList();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: EdgeInsets.only(right: 7),
        decoration: BoxDecoration(
          color: Provider.of<UserProvider>(context, listen: true).loggedUser.hsk == hsk ? Styles.baseColor70 : Styles.baseColor20,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: MyText(
          "HSK $hsk",
          textColor:
              Provider.of<UserProvider>(context, listen: true).loggedUser.hsk == hsk ? Styles.whiteColor : Styles.textColor,
        ),
      ),
    );
  }
}
