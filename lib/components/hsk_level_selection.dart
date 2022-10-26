import 'package:diyi/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_text.dart';
import 'package:provider/provider.dart';

import '../global/style.dart';

class HskLevelSelection extends StatefulWidget {
  @override
  State<HskLevelSelection> createState() => _HskLevelSelectionState();
}

class _HskLevelSelectionState extends State<HskLevelSelection> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<UserProvider>(context, listen: true).loggedUser == null ||
            Provider.of<UserProvider>(context, listen: true).loggedUser.hsk == null
        ? SizedBox()
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Styles.whiteColor.withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: MyText(
              "HSK ${Provider.of<UserProvider>(context, listen: true).loggedUser.hsk}",
              textColor: Styles.whiteColor,
              fontWeight: Styles.wBold,
            ),
          );
  }
}
