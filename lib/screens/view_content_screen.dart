import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:longoi_dot_ulun_kristian/database/app_database.dart';
import 'package:longoi_dot_ulun_kristian/database/daos_notifier/others_provider.dart';
import 'package:longoi_dot_ulun_kristian/database/daos_notifier/prayers_provider.dart';
import 'package:longoi_dot_ulun_kristian/database/daos_notifier/psalms_provider.dart';
import 'package:longoi_dot_ulun_kristian/models/models_notifier/active_list_provider.dart';
import 'package:longoi_dot_ulun_kristian/widgets/like_toggle.dart';
import 'package:provider/provider.dart';

class ViewContentScreen extends StatefulWidget {
  static const id = 'view_content_screen';
  const ViewContentScreen({Key? key}) : super(key: key);

  @override
  State<ViewContentScreen> createState() => _ViewContentScreenState();
}

class _ViewContentScreenState extends State<ViewContentScreen> {
  //variables for gesture font size
  double _fontSize = 20;
  final double _baseFontSize = 20;
  double _fontScale = 1;
  double _baseFontScale = 0.5;

  late dynamic bookProvider;
  late dynamic book;

  bool like = false;

  @override
  void initState() {
    super.initState();

    book = Provider.of<ActiveListProvider>(context, listen: false).getItem();
    castAs(book);
    bookProvider = getContentProvider(book);
    _fontSize = book.textSize;
    like = book.favorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          book.title,
          maxLines: 2,
        ),
        actions: [
          LikeToggle(
            activeColor: Colors.white,
            inactiveColor: Colors.black12,
            value: like,
            size: 23.0,
            onChanged: (_) {
              bookProvider.toggleFavorite(book);
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
        color: Theme.of(context).primaryColorLight.withOpacity(.08),
        padding: const EdgeInsets.all(10.0),
        child: NotificationListener(
          child: SingleChildScrollView(
            child: GestureDetector(
              onScaleStart: (details) => _baseFontScale = _fontScale,
              onScaleUpdate: (scaleUpdateDetails) {
                // don't update the UI if the scale didn't change
                if (scaleUpdateDetails.scale == 1.0) {
                  return;
                }
                setState(() {
                  _fontScale = (_baseFontScale * scaleUpdateDetails.scale)
                      .clamp(0.7, 3.0);
                  _fontSize = _fontScale * _baseFontSize;
                });
              },
              onScaleEnd: (details) {
                bookProvider.updateTextSize(book, _fontSize);
                print('scale end $_fontSize');
              },
              onDoubleTap: () {
                setState(() {
                  _fontSize = _baseFontSize;
                  bookProvider.updateTextSize(book, _fontSize);
                });
              },
              child: Html(
                data: book.contentHtml,
                style: {
                  'h3': Style(fontSize: FontSize(_fontSize + 2)),
                  'p': Style(fontSize: FontSize(_fontSize)),
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void castAs(dynamic book) {
    //print(book.runtimeType.toString());
    if (book is Psalm) {
      //book as Psalm;
    } else if (book is Prayer) {
      //book as Prayer;
    } else if (book is Other) {
      //book as Other;
    }
  }

  getContentProvider(book) {
    if (book is Psalm) {
      return Provider.of<PsalmsProvider>(context, listen: false);
    } else if (book is Prayer) {
      return Provider.of<PrayersProvider>(context, listen: false);
    } else if (book is Other) {
      return Provider.of<OthersProvider>(context, listen: false);
    }
  }
}
