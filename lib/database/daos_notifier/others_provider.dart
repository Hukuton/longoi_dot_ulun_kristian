import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../app_database.dart';
import 'books_provider.dart';

class OthersProvider extends BooksProvider {
  late OtherDao _otherDao;
  late AppDatabase _database;

  OthersProvider(BuildContext buildContext) {
    _database = Provider.of<AppDatabase>(buildContext, listen: false);
    _otherDao = OtherDao(_database);
  }

  Stream<List<Other>> _getAllOthers() {
    return _otherDao.getAllOthers();
  }

  Stream<List<Other>> _getFavoriteOthers() {
    return _otherDao.getFavoriteOthers();
  }

  /// Get all Others
  @override
  getAll() {
    return _getAllOthers();
  }

  ///Get all favorited Others
  @override
  getFavorites() {
    return _getFavoriteOthers();
  }

  /// Toggle favorite of a Others
  @override
  void toggleFavorite(DataClass dataClass) {
    Other other = dataClass as Other;
    bool favor = !other.favorite;
    _otherDao.updateOther(other.copyWith(favorite: favor));
    notifyListeners();
  }

  @override
  getFilteredTitle(String searchString) {
    return _otherDao.getFilteredOthers(searchString);
  }

  void updateTextSize(DataClass dataClass, double size) {
    Other other = dataClass as Other;
    _otherDao.updateOther(other.copyWith(textSize: size));
  }

  void updateSpeedScrolling(DataClass dataClass, double speed) {
    Other other = dataClass as Other;
    _otherDao.updateOther(other.copyWith(speed: speed));
  }
}
