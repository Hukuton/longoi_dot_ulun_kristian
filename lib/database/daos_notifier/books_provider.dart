import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';

abstract class BooksProvider extends ChangeNotifier {
  dynamic getAll();

  dynamic getFavorites();

  dynamic getFilteredTitle(String searchString);

  //void setSearchString(String searchString);

  //String getSearchString();

  void toggleFavorite(DataClass dataClass);
}
