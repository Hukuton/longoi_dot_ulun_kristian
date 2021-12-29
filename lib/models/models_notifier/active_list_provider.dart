import 'package:flutter/cupertino.dart';
import 'package:longoi_dot_ulun_kristian/utility/prefs.dart';
import 'package:wakelock/wakelock.dart';

import '../active_list.dart';

///Clicked item in a list open another screen.
///Usually we push some data into the new screen.
///But class will set the clicked item as an ActiveList in a Provider,
///so that no data is sent while using Navigator.
class ActiveListProvider extends ChangeNotifier {
  late final ActiveListItem _activeListItem = ActiveListItem();

  //ActiveListProvider(this._activeListItem);

  ///Item can be hymn, psalm, prayer, other, Liturgy
  void setItem(dynamic item) {
    _activeListItem.item = item;
    notifyListeners();
  }

  dynamic getItem() {
    return _activeListItem.item;
  }
}

///When Switch is toggled, on show the favorited list only.
class FavoritesOnlyProvider extends ChangeNotifier {
  final FavoritesOnly _favoritesOnly = FavoritesOnly();

  bool get isShowingFavoritesOnly => _favoritesOnly.showFavoriteOnly;

  //FavoritesOnlyProvider(this._favoritesOnly);

  void showFavoritesOnly(bool show) {
    _favoritesOnly.showFavoriteOnly = show;
    notifyListeners();
  }
}

///When typing something in the search bar, it query the database.
///Filtered item is shown in the list
class FilteredOnlyProvider extends ChangeNotifier {
  String _searchString = '';

  String get searchString => _searchString;

  set searchString(String value) {
    _searchString = value;
    notifyListeners();
  }

  final FilteredOnly _filteredOnly = FilteredOnly();
  bool get isShowingFilteredOnly => _filteredOnly.showFilteredOnly;

  void showFilteredOnly(bool show) {
    _filteredOnly.showFilteredOnly = show;
  }
}

class ListGridProvider extends ChangeNotifier {
  static const String viewKey = 'grid_or_list';
  bool isList = true;

  ListGridProvider() {
    isList = SharedPrefs.getBool(viewKey) ?? true;
  }

  void changeView(bool value) {
    isList = value;
    SharedPrefs.setBool(viewKey, isList);
    notifyListeners();
  }
}

class ListTextSizeProvider extends ChangeNotifier {
  static const String sizeKey = ' list_text_size';
  int fontSize = 17;

  ListTextSizeProvider() {
    fontSize = SharedPrefs.getInt(sizeKey) ?? 17;
  }

  void updateTextSize(int value) {
    fontSize = value;
    SharedPrefs.setInt(sizeKey, value);
    notifyListeners();
  }
}

class AlwaysAwakeProvider extends ChangeNotifier {
  static const String awakeKey = ' always_awake';
  bool alwaysAwake = false;

  AlwaysAwakeProvider() {
    alwaysAwake = SharedPrefs.getBool(awakeKey) ?? false;
    Wakelock.toggle(enable: alwaysAwake);
  }

  void setAlwaysAwake(bool awake) {
    alwaysAwake = awake;
    SharedPrefs.setBool(awakeKey, alwaysAwake);
    notifyListeners();
  }
}
