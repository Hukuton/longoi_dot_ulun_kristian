import 'package:drift/drift.dart';

class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  RealColumn get textSize => real()();
  BoolColumn get favorite => boolean().withDefault(const Constant(false))();
  RealColumn get speed => real()();
  TextColumn get version => text()();
}

@DataClassName("Hymn")
class Hymns extends Books {
  TextColumn get lyric => text()();
  TextColumn get jsonLyric => text()();
  TextColumn get notationHtml => text()();
}

@DataClassName("Liturgy")
class Liturgies extends Books {
  TextColumn get content => text()();
  TextColumn get contentJson => text()();
}

@DataClassName("Other")
class Others extends Books {
  TextColumn get content => text()();
  TextColumn get contentHtml => text()();
}

@DataClassName("Prayer")
class Prayers extends Books {
  TextColumn get content => text()();
  TextColumn get contentHtml => text()();
}

@DataClassName("Psalm")
class Psalms extends Books {
  TextColumn get content => text()();
  TextColumn get contentHtml => text()();
}
