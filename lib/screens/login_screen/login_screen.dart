import 'package:diyi/components/my_text.dart';
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
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [
            //       Styles.baseColor,
            //       Styles.baseColor.withOpacity(0.7),
            //     ],
            //     stops: [0.0, 1.0],
            //   ),
            // ),
            child: SafeArea(
                bottom: false,
                child: Center(
                    child: Stack(
                  children: [
                    // Positioned(
                    //     top: 50,
                    //     left: MediaQuery.of(context).size.width * 0.1,
                    //     child: Container(
                    //       width: MediaQuery.of(context).size.width * 0.8,
                    //       child: Image.asset(
                    //         "assets/images/bg_login_icon.png",
                    //         fit: BoxFit.fitWidth,
                    //       ),
                    //     )),
                    Align(
                      alignment: Alignment.bottomCenter,
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

  // body
  // body: SafeArea(
  // child: Center(
  // child: Stack(
  // children: [
  // Positioned(
  // top: 50,
  // left: MediaQuery.of(context).size.width * 0.1,
  // child: Container(
  // width: MediaQuery.of(context).size.width * 0.8,
  // child: Image.asset(
  // "assets/images/bg_login_icon.png",
  // fit: BoxFit.fitWidth,
  // ),
  // )),
  // Align(
  // alignment: Alignment.bottomCenter,
  // child: LoginContainer(
  // child: [
  // LoginTile(
  // login: () {
  // showWarningToasts("msg");
  // // Provider.of<UserProvider>(context, listen: false).signInWithFacebook();
  // },
  // icon: "assets/icons/ic_login_facebook.png",
  // title: "Facebook-р нэвтрэх",
  // ),
  // LoginTile(
  // login: () {
  // Provider.of<UserProvider>(context, listen: false).signInWithGoogle();
  // },
  // icon: "assets/icons/ic_login_google.png",
  // title: "Google-р нэвтрэх",
  // ),
  // SizedBox(height: 5),
  // MyText.medium(
  // "Аппликейшн-д бүртгүүлсэнээр үйлчилгээний нөхцөлийг зөвшөөрсөнд тооцно.",
  // textColor: Styles.whiteColor,
  // textAlign: TextAlign.center,
  // )
  // ],
  // ),
  // )
  // ],
  // ),
  // ),
  // )
}
