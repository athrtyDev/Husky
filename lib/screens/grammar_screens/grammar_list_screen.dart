import 'package:diyi/components/loader.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/providers/grammar_provider.dart';
import 'package:flutter/material.dart';
import 'package:diyi/components/my_app_bar.dart';
import 'package:diyi/global/style.dart';
import 'package:diyi/screens/grammar_screens/components/grammar_list_item.dart';
import 'package:provider/provider.dart';

class GrammarListScreen extends StatefulWidget {
  final dynamic args;
  const GrammarListScreen({this.args});

  @override
  _GrammarListScreenState createState() => _GrammarListScreenState();
}

class _GrammarListScreenState extends State<GrammarListScreen> {
  late String headerName;

  @override
  void initState() {
    super.initState();
    headerName = widget.args['headerName'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(title: headerName),
        backgroundColor: Styles.whiteColor,
        body: Provider.of<GrammarProvider>(context, listen: true).listSelectedGrammar == null
            ? Loader()
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText("Нийт ${Provider.of<GrammarProvider>(context, listen: true).listSelectedGrammar!.length} дүрэм:",
                        fontWeight: Styles.wBold),
                    SizedBox(height: 15),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (int i = 0;
                                i < Provider.of<GrammarProvider>(context, listen: true).listSelectedGrammar!.length;
                                i++)
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/grammar_detail_screen", arguments: {
                                    'listGrammar': Provider.of<GrammarProvider>(context, listen: false).listSelectedGrammar,
                                    'index': i,
                                    'title': headerName,
                                  });
                                },
                                child: GrammarListItem(
                                    grammar: Provider.of<GrammarProvider>(context, listen: true).listSelectedGrammar![i]),
                              )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
