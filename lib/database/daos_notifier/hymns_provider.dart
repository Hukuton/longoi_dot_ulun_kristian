import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../app_database.dart';
import 'books_provider.dart';

class HymnsProvider extends BooksProvider {
  late HymnDao _hymnDao;
  late AppDatabase _database;

  HymnsProvider(BuildContext buildContext) {
    _database = Provider.of<AppDatabase>(buildContext, listen: false);
    _hymnDao = HymnDao(_database);
  }

  Stream<List<Hymn>> _getAllHymns() {
    return _hymnDao.getAllHymns();
  }

  Stream<List<Hymn>> _getFavoriteHymns() {
    return _hymnDao.getFavoriteHymns();
  }

  // void toggleFavorite(Hymn hymn) {
  //   bool favor = !hymn.favorite;
  //   _hymnDao.updateHymn(hymn.copyWith(favorite: favor));
  //   notifyListeners();
  // }

  /// Get all Hymns
  @override
  getAll() {
    return _getAllHymns();
  }

  /// Get all favorited Hymns
  @override
  getFavorites() {
    return _getFavoriteHymns();
  }

  /// Toggle favorite of a Hymn
  @override
  void toggleFavorite(DataClass dataClass) {
    Hymn hymn = dataClass as Hymn;
    bool favor = !hymn.favorite;
    _hymnDao.updateHymn(hymn.copyWith(favorite: favor));
    notifyListeners();
  }

  @override
  getFilteredTitle(String searchString) {
    return _hymnDao.getFilteredHymn(searchString);
  }

  void updateTextSize(DataClass dataClass, double size) {
    Hymn hymn = dataClass as Hymn;
    _hymnDao.updateHymn(hymn.copyWith(textSize: size));
  }

  void updateSpeedScrolling(DataClass dataClass, double speed) {
    Hymn hymn = dataClass as Hymn;
    _hymnDao.updateHymn(hymn.copyWith(speed: speed));
  }
}
