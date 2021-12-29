import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../app_database.dart';
import 'books_provider.dart';

class PsalmsProvider extends BooksProvider {
  late PsalmDao _psalmDao;
  late AppDatabase _database;

  PsalmsProvider(BuildContext buildContext) {
    _database = Provider.of<AppDatabase>(buildContext, listen: false);
    _psalmDao = PsalmDao(_database);
  }

  Stream<List<Psalm>> _getAllPsalms() {
    return _psalmDao.getAllPsalms();
  }

  Stream<List<Psalm>> _getFavoritePsalms() {
    return _psalmDao.getFavoritePsalms();
  }

  /// Get all Psalms
  @override
  getAll() {
    return _getAllPsalms();
  }

  /// Get all Psalms
  @override
  getFavorites() {
    return _getFavoritePsalms();
  }

  /// Toggle favorite of a Psalm
  @override
  void toggleFavorite(DataClass dataClass) {
    Psalm psalm = dataClass as Psalm;
    bool favor = !psalm.favorite;
    _psalmDao.updatePsalm(psalm.copyWith(favorite: favor));
    notifyListeners();
  }

  @override
  getFilteredTitle(String searchString) {
    return _psalmDao.getFilteredPsalms(searchString);
  }

  void updateTextSize(DataClass dataClass, double size) {
    Psalm psalm = dataClass as Psalm;
    _psalmDao.updatePsalm(psalm.copyWith(textSize: size));
  }

  void updateSpeedScrolling(DataClass dataClass, double speed) {
    Psalm psalm = dataClass as Psalm;
    _psalmDao.updatePsalm(psalm.copyWith(speed: speed));
  }
}
