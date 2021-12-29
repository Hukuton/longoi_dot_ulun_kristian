import 'package:flutter/material.dart';
import 'package:longoi_dot_ulun_kristian/database/app_database.dart';
import 'package:longoi_dot_ulun_kristian/database/daos_notifier/books_provider.dart';
import 'package:longoi_dot_ulun_kristian/database/daos_notifier/hymns_provider.dart';
import 'package:longoi_dot_ulun_kristian/models/models_notifier/active_list_provider.dart';
import 'package:longoi_dot_ulun_kristian/screens/view_content_screen.dart';
import 'package:longoi_dot_ulun_kristian/screens/view_hymn_screen.dart';
import 'package:longoi_dot_ulun_kristian/screens/view_liturgy_screen.dart';
import 'package:longoi_dot_ulun_kristian/screens/view_notation_screen.dart';
import 'package:longoi_dot_ulun_kristian/utility/utility.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'like_toggle.dart';

import '../widgets/outline_button.dart' as butt;

class LikeableListView extends StatelessWidget {
  final BooksProvider booksProvider;

  const LikeableListView({Key? key, required this.booksProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filterProvider = Provider.of<FilteredOnlyProvider>(context);
    bool onlyFavorites =
        Provider.of<FavoritesOnlyProvider>(context).isShowingFavoritesOnly;
    bool onlyFiltered = filterProvider.isShowingFilteredOnly;

    AutoScrollController scrollController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Visibility(
          visible: booksProvider is HymnsProvider,
          child: Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: buildRow(scrollController, context),
              )),
        ),
        Expanded(
          flex: 14,
          child: StreamBuilder(
            stream: onlyFiltered
                ? booksProvider.getFilteredTitle(filterProvider.searchString)
                : (onlyFavorites
                    ? booksProvider.getFavorites()
                    : booksProvider.getAll()),
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              final books = snapshot.data ?? [];

              return ListView.builder(
                //separatorBuilder: (c, i) => const Divider(height: 1),
                itemCount: books.length,
                controller: scrollController,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemBuilder: (_, index) {
                  final book = books[index];
                  return AutoScrollTag(
                    key: ValueKey(index),
                    index: index,
                    controller: scrollController,
                    child: GestureDetector(
                      //go to view content screen
                      onTap: () {
                        Provider.of<ActiveListProvider>(context, listen: false)
                            .setItem(book);
                        goToScreen(context);
                      },
                      onLongPress: () {
                        if (book is Hymn) {
                          Provider.of<ActiveListProvider>(context,
                                  listen: false)
                              .setItem(book);
                          navigatorPush(context, const ViewNotationScreen());
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 3.0, top: 3.0, right: 6.0, left: 6.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor, //Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                                blurRadius: 40,
                                spreadRadius: 10),
                          ],
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Theme.of(context).primaryColor,
                            // Theme.of(context).colorScheme.secondaryVariant,
                            child: Text(
                              getAvatarText(book.title, index),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.apply(
                                      color: Colors.white, fontSizeFactor: 1.3),
                              //const TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          title: Text(
                            formatTitle(book.title, index),
                            style: TextStyle(
                                fontSize:
                                    Provider.of<ListTextSizeProvider>(context)
                                        .fontSize
                                        .toDouble()),
                          ),
                          trailing: LikeToggle(
                            activeColor: IconTheme.of(context).color,
                            inactiveColor: Colors.black26,
                            value: book.favorite,
                            size: 23.0,
                            onChanged: (_) =>
                                booksProvider.toggleFavorite(book),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildRow(AutoScrollController scrollController, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      color: Theme.of(context).primaryColor.withOpacity(0.07),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          butt.OutlineButton(
              text: '1',
              onPressed: () {
                scrollTo(scrollController, 0);
              }),
          butt.OutlineButton(
              text: '22',
              onPressed: () {
                scrollTo(scrollController, 21);
              }),
          butt.OutlineButton(
              text: '38',
              onPressed: () {
                scrollTo(scrollController, 37);
              }),
          butt.OutlineButton(
              text: '56',
              onPressed: () {
                scrollTo(scrollController, 55);
              }),
          butt.OutlineButton(
              text: '86',
              onPressed: () {
                scrollTo(scrollController, 85);
              }),
          butt.OutlineButton(
            text: '101',
            onPressed: () {
              scrollTo(scrollController, 100);
            },
          ),
        ],
      ),
    );
  }

  void scrollTo(AutoScrollController scrollController, int index) {
    scrollController.scrollToIndex(index,
        duration: const Duration(milliseconds: 1),
        preferPosition: AutoScrollPosition.begin);
  }

  ///Pass the title [string] and position [index] from list
  ///return string index for example
  /// * 1. Humormat do Kinoringan => 1
  /// * Kosipan dot Ulun Kristian => index
  String getAvatarText(String string, int index) {
    return string.contains(RegExp(r'[0-9]'))
        ? Utility.getInitial(string)
        : (index + 1).toString();
  }

  ///Pass the title [string] and position [index] from list
  ///return string with number equal to the avatar text
  /// * 1. Humormat do Kinoringan => Humormat do Kinoringan
  /// * Kosipan dot Ulun Kristian => Kosipan dot Ulun Kristian
  String formatTitle(String string, int index) {
    String avatarText = getAvatarText(string, index);
    String tempString = string.substring(0, avatarText.length);
    if (avatarText == tempString) {
      return string.substring(avatarText.length + 2, string.length);
    } else {
      return string;
    }
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
