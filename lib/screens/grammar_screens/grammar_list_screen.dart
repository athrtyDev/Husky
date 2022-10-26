import 'package:diyi/components/loader.dart';
import 'package:diyi/components/my_text.dart';
import 'package:diyi/core/classes/Grammar.dart';
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
  String headerName;
  List<Grammar> listGrammar;

  @override
  void initState() {
    super.initState();
    headerName = widget.args['headerName'];
    Future.delayed(Duration.zero, () async {
      setState(() {
        listGrammar = Provider.of<GrammarProvider>(context, listen: false).listSelectedGrammar;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(title: headerName),
        backgroundColor: Styles.whiteColor,
        body: listGrammar == null
            ? Loader()
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText("Нийт ${listGrammar.length} дүрэм:", fontWeight: Styles.wBold),
                    SizedBox(height: 15),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (int i = 0; i < listGrammar.length; i++)
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/grammar_detail_screen", arguments: {
                                    'listGrammar': listGrammar,
                                    'index': i,
                                    'title': headerName,
                                  });
                                },
                                child: GrammarListItem(grammar: listGrammar[i]),
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
