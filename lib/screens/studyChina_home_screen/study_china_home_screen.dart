import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/providers/tts_provider.dart';
import 'package:provider/provider.dart';

class StudyChinaHomeScreen extends StatefulWidget {
  const StudyChinaHomeScreen();

  @override
  _StudyChinaHomeScreenState createState() => _StudyChinaHomeScreenState();
}

enum TtsState { playing, stopped, paused, continued }

class _StudyChinaHomeScreenState extends State<StudyChinaHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "БНХАУ-д сурах"),
      backgroundColor: Styles.greyColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText.large("她是我妈妈"),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('speak'),
              onPressed: () {
                Provider.of<TtsProvider>(context, listen: false).speak("她是我妈妈");
              },
            ),
          ],
        ),
      ),
    );
  }
}
