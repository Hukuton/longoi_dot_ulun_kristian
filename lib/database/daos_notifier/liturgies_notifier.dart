import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../app_database.dart';
import 'books_provider.dart';

class LiturgiesProvider extends BooksProvider {
  late LiturgyDao _liturgyDao;
  late AppDatabase _database;

  LiturgiesProvider(BuildContext buildContext) {
    _database = Provider.of<AppDatabase>(buildContext, listen: false);
    _liturgyDao = LiturgyDao(_database);
  }

  Stream<List<Liturgy>> _getAllLiturgies() {
    return _liturgyDao.getAllLiturgies();
  }

  Stream<List<Liturgy>> _getFavoriteLiturgies() {
    return _liturgyDao.getFavoriteLiturgies();
  }

  /// Get all Liturgies
  @override
  getAll() {
    return _getAllLiturgies();
  }

  /// Get all favorited Liturgies
  @override
  getFavorites() {
    return _getFavoriteLiturgies();
  }

  /// Toggle favorite of a Liturgy
  @override
  void toggleFavorite(DataClass dataClass) {
    Liturgy liturgy = dataClass as Liturgy;
    bool favor = !liturgy.favorite;
    _liturgyDao.updateLiturgy(liturgy.copyWith(favorite: favor));
    notifyListeners();
  }

  @override
  getFilteredTitle(String searchString) {
    return _liturgyDao.getFilteredLiturgies(searchString);
  }

  void updateTextSize(DataClass dataClass, double size) {
    Liturgy liturgy = dataClass as Liturgy;
    _liturgyDao.updateLiturgy(liturgy.copyWith(textSize: size));
  }

  void updateSpeedScrolling(DataClass dataClass, double speed) {
    Liturgy liturgy = dataClass as Liturgy;
    _liturgyDao.updateLiturgy(liturgy.copyWith(speed: speed));
  }
}
