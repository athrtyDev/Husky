import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/core/classes/StudyInChina.dart';
import 'package:diyi/global/global.dart';
import 'package:diyi/providers/study_china_provider.dart';
import 'package:diyi/screens/coming_soon_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudyChinaDetailScreen extends StatefulWidget {
  final dynamic args;
  const StudyChinaDetailScreen({this.args});

  @override
  _StudyChinaDetailScreenState createState() => _StudyChinaDetailScreenState();
}

class _StudyChinaDetailScreenState extends State<StudyChinaDetailScreen> {
  String title;
  String image;

  @override
  void initState() {
    title = widget.args["title"];
    image = widget.args["image"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: title, color: Styles.greyColor),
      backgroundColor: Styles.greyColor,
      body: image != null
          ? SingleChildScrollView(
              child: Image.network(image),
            )
          : SizedBox(),
    );
  }
}
