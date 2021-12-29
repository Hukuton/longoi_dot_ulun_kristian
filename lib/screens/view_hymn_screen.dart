import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:longoi_dot_ulun_kristian/database/app_database.dart';
import 'package:longoi_dot_ulun_kristian/database/daos_notifier/hymns_provider.dart';
import 'package:longoi_dot_ulun_kristian/json_to_data/hymn/translated_hymn.dart';
import 'package:longoi_dot_ulun_kristian/models/models_notifier/active_list_provider.dart';
import 'package:longoi_dot_ulun_kristian/provider/theme_provider.dart';
import 'package:longoi_dot_ulun_kristian/screens/view_notation_screen.dart';
import 'package:longoi_dot_ulun_kristian/utility/utility.dart';
import 'package:longoi_dot_ulun_kristian/widgets/auto_scroll_controller.dart';
import 'package:longoi_dot_ulun_kristian/widgets/like_toggle.dart';
import 'package:provider/provider.dart';

class ViewHymnScreen extends StatefulWidget {
  static const id = 'view_hymn_screen';
  const ViewHymnScreen({Key? key}) : super(key: key);

  @override
  State<ViewHymnScreen> createState() => _ViewHymnScreenState();
}

class _ViewHymnScreenState extends State<ViewHymnScreen>
    with TickerProviderStateMixin {
  //variables for gesture font size
  double _fontSize = 50;
  final double _baseFontSize = 50;
  double _fontScale = 1;
  double _baseFontScale = 0.5;

  //variable for autoscroll
  final ScrollController _scrollController = ScrollController();
  bool _isScrolling = false;
  late double _speedFactor = 20;
  bool _visible = true;

  late HymnsProvider hymnsProvider;
  late Hymn hymn;
  late List<TranslatedHymn> translatedHymns;
  late FormLyric formLyric;

  bool like = false;

  @override
  void initState() {
    super.initState();
    hymnsProvider = Provider.of<HymnsProvider>(context, listen: false);
    hymn = Provider.of<ActiveListProvider>(context, listen: false).getItem();
    translatedHymns = (json.decode(hymn.jsonLyric) as List)
        .map((i) => TranslatedHymn.fromJson(i))
        .toList();
    _fontSize = hymn.textSize;
    _speedFactor = hymn.speed;
    like = hymn.favorite;
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    formLyric = FormLyric(
      translatedHymns: translatedHymns,
      fontSize: _fontSize,
      superScriptColor: isDark
          ? Utility.lighten(Theme.of(context).primaryColorLight, 0.3)
          : Utility.darken(Theme.of(context).primaryColor, 0.05),
      verseColor: isDark
          ? Utility.lighten(Theme.of(context).primaryColorLight, 0.7)
          : Utility.darken(Theme.of(context).primaryColor, 0.25),
      chorusColor: isDark
          ? Utility.lighten(Theme.of(context).primaryColorLight, 0.75)
          : Utility.darken(Theme.of(context).primaryColor, 0.3),
    );
    //print('is favor ${hymn.favorite}');

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          hymn.title,
          maxLines: 2,
        ),
        actions: [
          LikeToggle(
            activeColor: Colors.white,
            inactiveColor: Colors.black12,
            value: like,
            size: 23.0,
            onChanged: (_) {
              hymnsProvider.toggleFavorite(hymn);
              setState(() {
                like = !like;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.music_note),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ViewNotationScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).primaryColorLight.withOpacity(.08),
        child: NotificationListener(
          onNotification: (notification) {
            if (notification is ScrollEndNotification && _isScrolling) {
              Timer(const Duration(seconds: 1), () {
                _scroll();
              });
            }
            return true;
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                child: GestureDetector(
                  onScaleStart: (details) => _baseFontScale = _fontScale,
                  onScaleUpdate: (scaleUpdateDetails) {
                    // don't update the UI if the scale didn't change
                    if (scaleUpdateDetails.scale == 1.0) {
                      return;
                    }
                    setState(() {
                      _fontScale = (_baseFontScale * scaleUpdateDetails.scale)
                          .clamp(0.5, 5.0);
                      _fontSize = _fontScale * _baseFontSize;
                    });
                  },
                  onScaleEnd: (details) {
                    hymnsProvider.updateTextSize(hymn, _fontSize);
                    //print('scale end');
                  },
                  onDoubleTap: () {
                    setState(() {
                      _fontSize = _baseFontSize;
                      hymnsProvider.updateTextSize(hymn, _fontSize);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1,
                        //style: const TextStyle(color: Colors.black, fontSize: 36),
                        children: formLyric.texSpans,
                      ),
                      textScaleFactor: 0.5,
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.5,
                duration: const Duration(milliseconds: 500),
                child: AutoScrollerControl(
                  initSliderValue: _speedFactor,
                  pause: _isScrolling,
                  onTap: () {
                    _toggleScrolling();
                    _visible = !_visible;
                  },
                  onSlideEnd: (value) {
                    setState(() {
                      _speedFactor = value;
                      hymnsProvider.updateSpeedScrolling(hymn, _speedFactor);
                      if (_isScrolling) _scroll();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _scroll() {
    double maxExtent = _scrollController.position.maxScrollExtent;
    double distanceDifference = maxExtent - _scrollController.offset;
    double durationDouble = distanceDifference / _speedFactor;

    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(seconds: durationDouble.toInt()),
        curve: Curves.linear);
    if (_scrollController.offset >= maxExtent) {
      _isScrolling = false;
    }
  }

  _toggleScrolling() {
    setState(() {
      _isScrolling = !_isScrolling;
    });

    if (_isScrolling) {
      _scroll();
    } else {
      _scrollController.animateTo(_scrollController.offset,
          duration: const Duration(seconds: 1), curve: Curves.linear);
    }
  }
}

class FormLyric {
  List<TranslatedHymn> translatedHymns;
  int? start;
  int? end;
  List<TextSpan> texSpans = [];
  Color? superScriptColor;
  TextStyle? verseStyle;
  TextStyle? chorusStyle;
  Color? verseColor;
  Color? chorusColor;
  double? fontSize;

  FormLyric({
    required this.translatedHymns,
    this.start = 0,
    this.end,
    this.superScriptColor = Colors.black,
    this.verseStyle = const TextStyle(
      fontWeight: FontWeight.normal,
    ),
    this.chorusStyle = const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    this.verseColor, // = Colors.blue,
    this.chorusColor, // = Colors.red,
    this.fontSize,
  }) {
    _init();
  }

  int countVerse = 1;
  void _init() {
    const String _nl = '\n';
    for (var translatedHymn in translatedHymns) {
      countVerse = 1;
      for (var e in translatedHymn.lyrics) {
        String lyric = '';
        if (e.type == 1) {
          if (countVerse > 1) {
            texSpans.add(TextSpan(
              text: _nl + _nl,
              style:
                  verseStyle?.copyWith(fontSize: fontSize, color: verseColor),
            ));
          }
          texSpans.add(TextSpan(
            text: Utility.getSuperscriptNumber(countVerse),
            style: TextStyle(
                fontFamily: 'Roboto',
                color: superScriptColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w400),
          ));
          countVerse++;
          lyric = lyric + ' ' + e.text.replaceAll('\\n', _nl) + _nl;
          texSpans.add(TextSpan(
            text: lyric,
            style: verseStyle?.copyWith(
                fontSize: fontSize,
                color:
                    verseColor), //TextStyle(color: verseColor, fontSize: fontSize),
          ));
        } else if (e.type == 3) {
          String chorus = e.text.replaceAll('\\n', _nl) + _nl;
          texSpans.add(TextSpan(
            text: chorus,
            style:
                chorusStyle?.copyWith(color: chorusColor, fontSize: fontSize),
          ));
        }
      }
      texSpans.add(TextSpan(
        text: _nl,
        style: verseStyle?.copyWith(fontSize: fontSize, color: verseColor),
      ));
    }
  }
}
