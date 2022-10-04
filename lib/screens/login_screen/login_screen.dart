import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';
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
            // decoration: BoxDecoration(color: Styles.baseColor),
            child: SafeArea(
                bottom: false,
                child: Center(
                    child: Stack(
                  children: [
                    Positioned(top: -10, left: -150, child: birCircle(400, null)),
                    Positioned(bottom: -25, right: -70, child: birCircle(280, null)),
                    Align(
                      alignment: Alignment.center,
                      child: LoginContainer(
                        child: [
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
                          SizedBox(height: 5),
                          MyText.medium(
                            "Аппликейшн-д бүртгүүлсэнээр үйлчилгээний нөхцөлийг зөвшөөрсөнд тооцно.",
                            // textColor: Styles.whiteColor,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 80),
                        ],
                      ),
                    )
                  ],
                )))));
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
}
