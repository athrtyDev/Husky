import 'dart:io';

import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/providers/user_provider.dart';
import 'package:diyi/screens/login_screen/components/login_container.dart';
import 'package:diyi/screens/login_screen/components/login_tile.dart';
import 'package:diyi/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: Styles.baseGradient),
            child: Center(
                child: Stack(
              children: [
                // Positioned(top: 0, child: backGround()),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Image.asset(
                        "assets/logo/logo_white.png",
                        fit: BoxFit.fitWidth,
                        // height: MediaQuery.of(context).size.height * 0.18,
                        height: MediaQuery.of(context).size.height * 0.19,
                      ),
                      SizedBox(height: 70),
                      LoginContainer(
                        child: [
                          Platform.isIOS
                              ? LoginTile(
                                  login: () async {
                                    showLoading(context);
                                    await Provider.of<UserProvider>(context, listen: false).signInWithApple();
                                    hideLoading();
                                  },
                                  icon: "assets/icons/ic_login_apple.png",
                                  title: "Apple-р нэвтрэх",
                                )
                              : const SizedBox(),
                          LoginTile(
                            login: () async {
                              showLoading(context);
                              await Provider.of<UserProvider>(context, listen: false).signInWithFacebook();
                              hideLoading();
                            },
                            icon: "assets/icons/ic_login_facebook.png",
                            title: "Facebook-р нэвтрэх",
                          ),
                          LoginTile(
                            login: () async {
                              showLoading(context);
                              await Provider.of<UserProvider>(context, listen: false).signInWithGoogle();
                              hideLoading();
                            },
                            icon: "assets/icons/ic_login_google.png",
                            title: "Google-р нэвтрэх",
                          ),
                          SizedBox(height: 20),
                          MyText.medium(
                            "Аппликейшн-д бүртгүүлсэнээр үйлчилгээний нөхцөлийг зөвшөөрсөнд тооцно.",
                            // textColor: Styles.whiteColor,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ))));
  }

  birCircle(double radius, double insideRadius) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(color: Styles.baseColor, shape: BoxShape.circle),
      child: insideRadius != null
          ? Center(
              child: Container(
                height: insideRadius,
                width: insideRadius,
                decoration: BoxDecoration(color: Styles.whiteColor, shape: BoxShape.circle),
              ),
            )
          : SizedBox(),
    );
  }

  backGround() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.62,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Styles.baseColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
    );
  }
}
