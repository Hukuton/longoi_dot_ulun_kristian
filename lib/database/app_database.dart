import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'models/books.dart';

part 'app_database.g.dart';

//flutter packages pub run build_runner build

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'lduk.db'));

    if (!await file.exists()) {
      // Extract the pre-populated database file from assets
      final blob = await rootBundle.load('assets/lduk.db');
      List<int> bytes =
          blob.buffer.asInt8List(blob.offsetInBytes, blob.lengthInBytes);
      await file.writeAsBytes(bytes);
    }
    //print('Open db');
    return NativeDatabase(file);
  });
}

// LazyDatabase _openConnections() {
//   // the LazyDatabase util lets us find the right location for the file async.
//   return LazyDatabase(() async {
//     // put the database file, called db.sqlite here, into the documents folder
//     // for your app.
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     //print('Opening database');
//     return NativeDatabase(file);
//   });
// }

@DriftDatabase(tables: [Books, Hymns, Liturgies, Others, Prayers, Psalms])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [Hymns])
class HymnDao extends DatabaseAccessor<AppDatabase> with _$HymnDaoMixin {
  final AppDatabase db;
  HymnDao(this.db) : super(db);

  ///Get all hymns ordered by title in ascending order
  Stream<List<Hymn>> getAllHymns() {
    return (select(hymns)
          ..orderBy(
            ([
              (t) => OrderingTerm(expression: t.id, mode: OrderingMode.asc),
            ]),
          ))
        .watch();
  }

  ///Get all favorited hymns ordered by title in ascending order
  Stream<List<Hymn>> getFavoriteHymns() {
    return (select(hymns)
          ..orderBy(
            ([
              (t) => OrderingTerm(expression: t.id),
            ]),
          )
          ..where((t) => t.favorite.equals(true)))
        .watch();
  }

  Stream<List<Hymn>> getFilteredHymn(String searchString) {
    searchString = '%$searchString%';

    return customSelect(
      'SELECT * FROM hymns WHERE title LIKE ?;',
      variables: [
        Variable.withString(searchString),
      ],
      readsFrom: {hymns},
    ).watch().map((rows) {
      // Turning the data of a row into a Task object
      return rows.map((row) => Hymn.fromData(row.data)).toList();
    });
  }

  Future insertHymn(Insertable<Hymn> hymn) => into(hymns).insert(hymn);
  Future updateHymn(Insertable<Hymn> hymn) => update(hymns).replace(hymn);
  Future deleteHymn(Insertable<Hymn> hymn) => delete(hymns).delete(hymn);
}

@DriftAccessor(tables: [Psalms])
class PsalmDao extends DatabaseAccessor<AppDatabase> with _$PsalmDaoMixin {
  PsalmDao(AppDatabase db) : super(db);

  ///Get all Psalms ordered by title in ascending order
  Stream<List<Psalm>> getAllPsalms() {
    return (select(psalms)
          ..orderBy(
            ([
              (t) => OrderingTerm(expression: t.id, mode: OrderingMode.asc),
            ]),
          ))
        .watch();
  }

  ///Get all favorited Psalms ordered by title in ascending order
  Stream<List<Psalm>> getFavoritePsalms() {
    return (select(psalms)
          ..orderBy(
            ([
              (t) => OrderingTerm(expression: t.id),
            ]),
          )
          ..where((t) => t.favorite.equals(true)))
        .watch();
  }

  Stream<List<Psalm>> getFilteredPsalms(String searchString) {
    searchString = '%$searchString%';

    return customSelect(
      'SELECT * FROM psalms WHERE title LIKE ?;',
      variables: [
        Variable.withString(searchString),
      ],
      readsFrom: {psalms},
    ).watch().map((rows) {
      return rows.map((row) => Psalm.fromData(row.data)).toList();
    });
  }

  Future insertPsalm(Insertable<Psalm> psalm) => into(psalms).insert(psalm);
  Future updatePsalm(Insertable<Psalm> psalm) => update(psalms).replace(psalm);
  Future deletePsalm(Insertable<Psalm> psalm) => delete(psalms).delete(psalm);
}

@DriftAccessor(tables: [Others])
class OtherDao extends DatabaseAccessor<AppDatabase> with _$OtherDaoMixin {
  OtherDao(AppDatabase db) : super(db);

  ///Get all Others ordered by title in ascending order
  Stream<List<Other>> getAllOthers() {
    return (select(others)
          ..orderBy(
            ([
              (t) => OrderingTerm(expression: t.id, mode: OrderingMode.asc),
            ]),
          ))
        .watch();
  }

  ///Get all favorited Others ordered by title in ascending order
  Stream<List<Other>> getFavoriteOthers() {
    return (select(others)
          ..orderBy(
            ([
              (t) => OrderingTerm(expression: t.id),
            ]),
          )
          ..where((t) => t.favorite.equals(true)))
        .watch();
  }

  Stream<List<Other>> getFilteredOthers(String searchString) {
    searchString = '%$searchString%';

    return customSelect(
      'SELECT * FROM psalms WHERE title LIKE ?;',
      variables: [
        Variable.withString(searchString),
      ],
      readsFrom: {others},
    ).watch().map((rows) {
      return rows.map((row) => Other.fromData(row.data)).toList();
    });
  }

  Future insertOther(Insertable<Other> other) => into(others).insert(other);
  Future updateOther(Insertable<Other> other) => update(others).replace(other);
  Future deleteOther(Insertable<Other> other) => delete(others).delete(other);
}

@DriftAccessor(tables: [Prayers])
class PrayerDao extends DatabaseAccessor<AppDatabase> with _$PrayerDaoMixin {
  PrayerDao(AppDatabase db) : super(db);

  ///Get all Prayers ordered by title in ascending order
  Stream<List<Prayer>> getAllPrayers() {
    return (select(prayers)
          ..orderBy(
            ([
              (t) => OrderingTerm(expression: t.id, mode: OrderingMode.asc),
            ]),
          ))
        .watch();
  }

  ///Get all favorited Prayers ordered by title in ascending order
  Stream<List<Prayer>> getFavoritePrayers() {
    return (select(prayers)
          ..orderBy(
            ([
              (t) => OrderingTerm(expression: t.id),
            ]),
          )
          ..where((t) => t.favorite.equals(true)))
        .watch();
  }

  Stream<List<Prayer>> getFilteredPrayers(String searchString) {
    searchString = '%$searchString%';

    return customSelect(
      'SELECT * FROM psalms WHERE title LIKE ?;',
      variables: [
        Variable.withString(searchString),
      ],
      readsFrom: {prayers},
    ).watch().map((rows) {
      return rows.map((row) => Prayer.fromData(row.data)).toList();
    });
  }

  Future insertPrayer(Insertable<Prayer> prayer) =>
      into(prayers).insert(prayer);
  Future updatePrayer(Insertable<Prayer> prayer) =>
      update(prayers).replace(prayer);
  Future deletePrayer(Insertable<Prayer> prayer) =>
      delete(prayers).delete(prayer);
}

@DriftAccessor(tables: [Liturgies])
class LiturgyDao extends DatabaseAccessor<AppDatabase> with _$LiturgyDaoMixin {
  LiturgyDao(AppDatabase db) : super(db);

  ///Get all Liturgies ordered by title in ascending order
  Stream<List<Liturgy>> getAllLiturgies() {
    return (select(liturgies)
          ..orderBy(
            ([
              (t) => OrderingTerm(expression: t.id, mode: OrderingMode.asc),
            ]),
          ))
        .watch();
  }

  ///Get all favorited Liturgies ordered by title in ascending order
  Stream<List<Liturgy>> getFavoriteLiturgies() {
    return (select(liturgies)
          ..orderBy(
            ([
              (t) => OrderingTerm(expression: t.id),
            ]),
          )
          ..where((t) => t.favorite.equals(true)))
        .watch();
  }

  Stream<List<Liturgy>> getFilteredLiturgies(String searchString) {
    searchString = '%$searchString%';

    return customSelect(
      'SELECT * FROM psalms WHERE title LIKE ?;',
      variables: [
        Variable.withString(searchString),
      ],
      readsFrom: {liturgies},
    ).watch().map((rows) {
      return rows.map((row) => Liturgy.fromData(row.data)).toList();
    });
  }

  Future insertLiturgy(Insertable<Liturgy> liturgy) =>
      into(liturgies).insert(liturgy);
  Future updateLiturgy(Insertable<Liturgy> liturgy) =>
      update(liturgies).replace(liturgy);
  Future deleteLiturgy(Insertable<Liturgy> liturgy) =>
      delete(liturgies).delete(liturgy);
}
