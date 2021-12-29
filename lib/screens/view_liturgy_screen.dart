import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:longoi_dot_ulun_kristian/database/app_database.dart';
import 'package:longoi_dot_ulun_kristian/database/daos_notifier/liturgies_notifier.dart';
import 'package:longoi_dot_ulun_kristian/json_to_data/liturgy/liturgy_model.dart';
import 'package:longoi_dot_ulun_kristian/models/models_notifier/active_list_provider.dart';
import 'package:longoi_dot_ulun_kristian/widgets/like_toggle.dart';
import 'package:provider/provider.dart';

class ViewLiturgyScreen extends StatefulWidget {
  static const id = 'view_liturgy_screen';
  const ViewLiturgyScreen({Key? key}) : super(key: key);

  @override
  State<ViewLiturgyScreen> createState() => _ViewLiturgyScreenState();
}

class _ViewLiturgyScreenState extends State<ViewLiturgyScreen> {
  //variables for gesture font size
  double _fontSize = 20;
  final double _baseFontSize = 20;
  double _fontScale = 1;
  double _baseFontScale = 0.5;

  late LiturgiesProvider liturgiesProvider;
  late Liturgy liturgy;
  late LiturgyModel liturgyModel;
  late FormLiturgy formLiturgy;

  bool like = false;

  @override
  void initState() {
    super.initState();
    liturgiesProvider = Provider.of<LiturgiesProvider>(context, listen: false);
    liturgy = Provider.of<ActiveListProvider>(context, listen: false).getItem();
    liturgyModel = LiturgyModel.fromJson(jsonDecode(liturgy.contentJson));
    _fontSize = liturgy.textSize;
    like = liturgy.favorite;
  }

  @override
  Widget build(BuildContext context) {
    formLiturgy = FormLiturgy(
        liturgy: liturgyModel, context: context, textSize: _fontSize);
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          liturgy.title,
          maxLines: 2,
        ),
        actions: [
          LikeToggle(
            activeColor: Colors.white,
            inactiveColor: Colors.black12,
            value: like,
            size: 23.0,
            onChanged: (_) {
              liturgiesProvider.toggleFavorite(liturgy);
              setState(() {
                like = !like;
              });
            },
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).primaryColorLight.withOpacity(0),
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GestureDetector(
            onScaleStart: (details) => _baseFontScale = _fontScale,
            onScaleUpdate: (scaleUpdateDetails) {
              // don't update the UI if the scale didn't change
              if (scaleUpdateDetails.scale == 1.0) {
                return;
              }
              setState(() {
                _fontScale =
                    (_baseFontScale * scaleUpdateDetails.scale).clamp(0.7, 3.0);
                _fontSize = _fontScale * _baseFontSize;
              });
            },
            onScaleEnd: (details) {
              liturgiesProvider.updateTextSize(liturgy, _fontSize);
              //print('scale end');
            },
            onDoubleTap: () {
              setState(() {
                _fontSize = _baseFontSize;
                liturgiesProvider.updateTextSize(liturgy, _fontSize);
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: formLiturgy.widgets,
            ),
          ),
        ),
      ),
    );
  }
}

class FormLiturgy {
  int counter = 1;
  List<Widget> widgets = [];
  bool isExpandable = false;
  late Color collapsedBackgroundColor;
  //late Color sectionTextColor;
  final LiturgyModel liturgy;
  final BuildContext context;
  final double textSize;

  FormLiturgy(
      {required this.liturgy, required this.context, required this.textSize}) {
    collapsedBackgroundColor =
        Theme.of(context).primaryColorLight.withOpacity(0.3);
    //sectionTextColor = Theme.of(context).textTheme.headline1?.color!!;
    init();
  }

  void init() {
    if (liturgy.intro.isNotEmpty) {
      widgets.add(Text(
        liturgy.intro,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: textSize),
      ));
      widgets.add(const SizedBox(
        height: 5,
      ));
    }

    for (var section in liturgy.section) {
      if (section.sectionTitle.isNotEmpty) {
        widgets.add(Container(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(
            child: Text(
              section.sectionTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: textSize + 3,
              ),
            ),
          ),
        ));
        widgets.add(const SizedBox(
          height: 5,
        ));
      }
      for (var content in section.content) {
        isExpandable = content.paragraph.isEmpty;

        if (isExpandable) {
          widgets.add(
            IgnorePointer(
              ignoring: true,
              child: ListTileTheme(
                contentPadding: const EdgeInsets.only(left: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ExpansionTile(
                    //backgroundColor: Colors.black26,
                    collapsedBackgroundColor: collapsedBackgroundColor,
                    title: Text(
                      content.header,
                      style: TextStyle(fontSize: textSize),
                    ),
                    children: [
                      Text(
                        content.paragraph,
                        style: TextStyle(fontSize: textSize),
                      )
                    ],
                    leading: CircleAvatar(
                      radius: 17.0,
                      child: Text('$counter'),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          widgets.add(
            ListTileTheme(
              contentPadding: const EdgeInsets.only(left: 5, right: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ExpansionTile(
                  collapsedBackgroundColor: collapsedBackgroundColor,
                  title: Text(
                    content.header,
                    style: TextStyle(fontSize: textSize + 2),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Html(
                        data: content.paragraph,
                        style: {
                          'p': Style(fontSize: FontSize(textSize)),
                        },
                      ),
                    )
                  ],
                  leading: CircleAvatar(
                    radius: 17.0,
                    child: Text(
                      '$counter',
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        widgets.add(const SizedBox(
          height: 5,
        ));
        counter++;
      }
    }
  }
}
