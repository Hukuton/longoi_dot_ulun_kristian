import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../app_database.dart';
import 'books_provider.dart';

class PrayersProvider extends BooksProvider {
  late PrayerDao _prayerDao;
  late AppDatabase _database;

  PrayersProvider(BuildContext buildContext) {
    _database = Provider.of<AppDatabase>(buildContext, listen: false);
    _prayerDao = PrayerDao(_database);
  }

  Stream<List<Prayer>> _getAllPrayers() {
    return _prayerDao.getAllPrayers();
  }

  Stream<List<Prayer>> _getFavoritePrayers() {
    return _prayerDao.getFavoritePrayers();
  }

  /// Get all Prayers
  @override
  getAll() {
    return _getAllPrayers();
  }

  /// Get all favorited Prayers
  @override
  getFavorites() {
    return _getFavoritePrayers();
  }

  /// Toggle favorite of a Prayer
  @override
  void toggleFavorite(DataClass dataClass) {
    Prayer prayer = dataClass as Prayer;
    bool favor = !prayer.favorite;
    _prayerDao.updatePrayer(prayer.copyWith(favorite: favor));
    notifyListeners();
  }

  @override
  getFilteredTitle(String searchString) {
    return _prayerDao.getFilteredPrayers(searchString);
  }

  void updateTextSize(DataClass dataClass, double size) {
    Prayer prayer = dataClass as Prayer;
    _prayerDao.updatePrayer(prayer.copyWith(textSize: size));
  }

  void updateSpeedScrolling(DataClass dataClass, double speed) {
    Prayer prayer = dataClass as Prayer;
    _prayerDao.updatePrayer(prayer.copyWith(speed: speed));
  }
}
