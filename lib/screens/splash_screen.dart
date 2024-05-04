import 'package:diyi/core/api.dart';
import 'package:diyi/global/global.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getAppStaticData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.baseColor,
      alignment: Alignment(0, 0),
      child: Image.asset(
        "assets/logo/ic_launcher.png",
        fit: BoxFit.fitWidth,
        height: 140,
      ),
    );
  }

  Future<void> getAppStaticData() async {
    Api api = Api();
    app.appStaticData = await api.getAppStaticData();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    app.isReviewingVersion = int.parse(packageInfo.buildNumber) > app.appStaticData.static!['approved_build_number'];
    print("installed version: ${packageInfo.buildNumber}. isReviewingVersion: ${app.isReviewingVersion}");
    app.shouldUpdate = int.parse(packageInfo.buildNumber) < app.appStaticData.static!['approved_build_number'];
    Navigator.pushNamed(context, '/main');
  }
}
