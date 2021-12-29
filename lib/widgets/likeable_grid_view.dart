import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:longoi_dot_ulun_kristian/database/app_database.dart';
import 'package:longoi_dot_ulun_kristian/database/daos_notifier/books_provider.dart';
import 'package:longoi_dot_ulun_kristian/models/models_notifier/active_list_provider.dart';
import 'package:longoi_dot_ulun_kristian/screens/view_content_screen.dart';
import 'package:longoi_dot_ulun_kristian/screens/view_hymn_screen.dart';
import 'package:longoi_dot_ulun_kristian/screens/view_liturgy_screen.dart';
import 'package:longoi_dot_ulun_kristian/screens/view_notation_screen.dart';
import 'package:provider/provider.dart';

import 'like_toggle.dart';

class LikeAbleGridView extends StatelessWidget {
  final BooksProvider booksProvider;

  const LikeAbleGridView({Key? key, required this.booksProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filterProvider = Provider.of<FilteredOnlyProvider>(context);
    bool onlyFavorites =
        Provider.of<FavoritesOnlyProvider>(context).isShowingFavoritesOnly;
    bool onlyFiltered = filterProvider.isShowingFilteredOnly;

    return StreamBuilder(
      stream: onlyFiltered
          ? booksProvider.getFilteredTitle(filterProvider.searchString)
          : (onlyFavorites
              ? booksProvider.getFavorites()
              : booksProvider.getAll()),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        final books = snapshot.data ?? [];
        return Container(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 6,
              children: List.generate(
                books.length,
                (index) {
                  final book = books[index];
                  return LikeAbleCard(
                    book: book,
                    booksProvider: booksProvider,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class LikeAbleCard extends StatelessWidget {
  final BooksProvider booksProvider;
  final dynamic book;
  const LikeAbleCard({Key? key, this.book, required this.booksProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ActiveListProvider>(context, listen: false).setItem(book);
        goToScreen(context);
      },
      onLongPress: () {
        if (book is Hymn) {
          Provider.of<ActiveListProvider>(context, listen: false).setItem(book);
          navigatorPush(context, const ViewNotationScreen());
        }
      },
      child: Container(
        margin: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.05),
              blurRadius: 40,
              spreadRadius: 10,
            ),
          ],
        ),
        padding: const EdgeInsets.all(3.0),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AutoSizeText(
                    book.id.toString(),
                    //style: const TextStyle(fontSize: 20.0),
                    maxFontSize: 30.0,
                    minFontSize: 25.0,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LikeToggle(
                  value: book.favorite,
                  inactiveColor: Colors.black26,
                  activeColor: IconTheme.of(context).color,
                  size: 20.0,
                  onChanged: (_) => booksProvider.toggleFavorite(book),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void goToScreen(BuildContext context) {
    dynamic book =
        Provider.of<ActiveListProvider>(context, listen: false).getItem();
    //Special treatment for Hymn screen
    if (book is Hymn) {
      navigatorPush(context, const ViewHymnScreen());
    } else if (book is Liturgy) {
      navigatorPush(context, const ViewLiturgyScreen());
    } else {
      navigatorPush(context, const ViewContentScreen());
    }
  }

  void navigatorPush(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
