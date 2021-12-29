// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Book extends DataClass implements Insertable<Book> {
  final int id;
  final String title;
  final double textSize;
  final bool favorite;
  final double speed;
  final String version;
  Book(
      {required this.id,
      required this.title,
      required this.textSize,
      required this.favorite,
      required this.speed,
      required this.version});
  factory Book.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Book(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      textSize: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}text_size'])!,
      favorite: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favorite'])!,
      speed: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}speed'])!,
      version: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}version'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['text_size'] = Variable<double>(textSize);
    map['favorite'] = Variable<bool>(favorite);
    map['speed'] = Variable<double>(speed);
    map['version'] = Variable<String>(version);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      title: Value(title),
      textSize: Value(textSize),
      favorite: Value(favorite),
      speed: Value(speed),
      version: Value(version),
    );
  }

  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      textSize: serializer.fromJson<double>(json['textSize']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      speed: serializer.fromJson<double>(json['speed']),
      version: serializer.fromJson<String>(json['version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'textSize': serializer.toJson<double>(textSize),
      'favorite': serializer.toJson<bool>(favorite),
      'speed': serializer.toJson<double>(speed),
      'version': serializer.toJson<String>(version),
    };
  }

  Book copyWith(
          {int? id,
          String? title,
          double? textSize,
          bool? favorite,
          double? speed,
          String? version}) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        textSize: textSize ?? this.textSize,
        favorite: favorite ?? this.favorite,
        speed: speed ?? this.speed,
        version: version ?? this.version,
      );
  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('textSize: $textSize, ')
          ..write('favorite: $favorite, ')
          ..write('speed: $speed, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, textSize, favorite, speed, version);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == this.id &&
          other.title == this.title &&
          other.textSize == this.textSize &&
          other.favorite == this.favorite &&
          other.speed == this.speed &&
          other.version == this.version);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> textSize;
  final Value<bool> favorite;
  final Value<double> speed;
  final Value<String> version;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.textSize = const Value.absent(),
    this.favorite = const Value.absent(),
    this.speed = const Value.absent(),
    this.version = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double textSize,
    this.favorite = const Value.absent(),
    required double speed,
    required String version,
  })  : title = Value(title),
        textSize = Value(textSize),
        speed = Value(speed),
        version = Value(version);
  static Insertable<Book> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? textSize,
    Expression<bool>? favorite,
    Expression<double>? speed,
    Expression<String>? version,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (textSize != null) 'text_size': textSize,
      if (favorite != null) 'favorite': favorite,
      if (speed != null) 'speed': speed,
      if (version != null) 'version': version,
    });
  }

  BooksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<double>? textSize,
      Value<bool>? favorite,
      Value<double>? speed,
      Value<String>? version}) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      textSize: textSize ?? this.textSize,
      favorite: favorite ?? this.favorite,
      speed: speed ?? this.speed,
      version: version ?? this.version,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (textSize.present) {
      map['text_size'] = Variable<double>(textSize.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('textSize: $textSize, ')
          ..write('favorite: $favorite, ')
          ..write('speed: $speed, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }
}

class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BooksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _textSizeMeta = const VerificationMeta('textSize');
  @override
  late final GeneratedColumn<double?> textSize = GeneratedColumn<double?>(
      'text_size', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _favoriteMeta = const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<bool?> favorite = GeneratedColumn<bool?>(
      'favorite', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (favorite IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double?> speed = GeneratedColumn<double?>(
      'speed', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _versionMeta = const VerificationMeta('version');
  @override
  late final GeneratedColumn<String?> version = GeneratedColumn<String?>(
      'version', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, textSize, favorite, speed, version];
  @override
  String get aliasedName => _alias ?? 'books';
  @override
  String get actualTableName => 'books';
  @override
  VerificationContext validateIntegrity(Insertable<Book> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('text_size')) {
      context.handle(_textSizeMeta,
          textSize.isAcceptableOrUnknown(data['text_size']!, _textSizeMeta));
    } else if (isInserting) {
      context.missing(_textSizeMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    }
    if (data.containsKey('speed')) {
      context.handle(
          _speedMeta, speed.isAcceptableOrUnknown(data['speed']!, _speedMeta));
    } else if (isInserting) {
      context.missing(_speedMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Book.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(_db, alias);
  }
}

class Hymn extends DataClass implements Insertable<Hymn> {
  final int id;
  final String title;
  final double textSize;
  final bool favorite;
  final double speed;
  final String version;
  final String lyric;
  final String jsonLyric;
  final String notationHtml;
  Hymn(
      {required this.id,
      required this.title,
      required this.textSize,
      required this.favorite,
      required this.speed,
      required this.version,
      required this.lyric,
      required this.jsonLyric,
      required this.notationHtml});
  factory Hymn.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Hymn(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      textSize: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}text_size'])!,
      favorite: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favorite'])!,
      speed: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}speed'])!,
      version: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}version'])!,
      lyric: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lyric'])!,
      jsonLyric: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}json_lyric'])!,
      notationHtml: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}notation_html'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['text_size'] = Variable<double>(textSize);
    map['favorite'] = Variable<bool>(favorite);
    map['speed'] = Variable<double>(speed);
    map['version'] = Variable<String>(version);
    map['lyric'] = Variable<String>(lyric);
    map['json_lyric'] = Variable<String>(jsonLyric);
    map['notation_html'] = Variable<String>(notationHtml);
    return map;
  }

  HymnsCompanion toCompanion(bool nullToAbsent) {
    return HymnsCompanion(
      id: Value(id),
      title: Value(title),
      textSize: Value(textSize),
      favorite: Value(favorite),
      speed: Value(speed),
      version: Value(version),
      lyric: Value(lyric),
      jsonLyric: Value(jsonLyric),
      notationHtml: Value(notationHtml),
    );
  }

  factory Hymn.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Hymn(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      textSize: serializer.fromJson<double>(json['textSize']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      speed: serializer.fromJson<double>(json['speed']),
      version: serializer.fromJson<String>(json['version']),
      lyric: serializer.fromJson<String>(json['lyric']),
      jsonLyric: serializer.fromJson<String>(json['jsonLyric']),
      notationHtml: serializer.fromJson<String>(json['notationHtml']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'textSize': serializer.toJson<double>(textSize),
      'favorite': serializer.toJson<bool>(favorite),
      'speed': serializer.toJson<double>(speed),
      'version': serializer.toJson<String>(version),
      'lyric': serializer.toJson<String>(lyric),
      'jsonLyric': serializer.toJson<String>(jsonLyric),
      'notationHtml': serializer.toJson<String>(notationHtml),
    };
  }

  Hymn copyWith(
          {int? id,
          String? title,
          double? textSize,
          bool? favorite,
          double? speed,
          String? version,
          String? lyric,
          String? jsonLyric,
          String? notationHtml}) =>
      Hymn(
        id: id ?? this.id,
        title: title ?? this.title,
        textSize: textSize ?? this.textSize,
        favorite: favorite ?? this.favorite,
        speed: speed ?? this.speed,
        version: version ?? this.version,
        lyric: lyric ?? this.lyric,
        jsonLyric: jsonLyric ?? this.jsonLyric,
        notationHtml: notationHtml ?? this.notationHtml,
      );
  @override
  String toString() {
    return (StringBuffer('Hymn(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('textSize: $textSize, ')
          ..write('favorite: $favorite, ')
          ..write('speed: $speed, ')
          ..write('version: $version, ')
          ..write('lyric: $lyric, ')
          ..write('jsonLyric: $jsonLyric, ')
          ..write('notationHtml: $notationHtml')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, textSize, favorite, speed, version,
      lyric, jsonLyric, notationHtml);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hymn &&
          other.id == this.id &&
          other.title == this.title &&
          other.textSize == this.textSize &&
          other.favorite == this.favorite &&
          other.speed == this.speed &&
          other.version == this.version &&
          other.lyric == this.lyric &&
          other.jsonLyric == this.jsonLyric &&
          other.notationHtml == this.notationHtml);
}

class HymnsCompanion extends UpdateCompanion<Hymn> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> textSize;
  final Value<bool> favorite;
  final Value<double> speed;
  final Value<String> version;
  final Value<String> lyric;
  final Value<String> jsonLyric;
  final Value<String> notationHtml;
  const HymnsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.textSize = const Value.absent(),
    this.favorite = const Value.absent(),
    this.speed = const Value.absent(),
    this.version = const Value.absent(),
    this.lyric = const Value.absent(),
    this.jsonLyric = const Value.absent(),
    this.notationHtml = const Value.absent(),
  });
  HymnsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double textSize,
    this.favorite = const Value.absent(),
    required double speed,
    required String version,
    required String lyric,
    required String jsonLyric,
    required String notationHtml,
  })  : title = Value(title),
        textSize = Value(textSize),
        speed = Value(speed),
        version = Value(version),
        lyric = Value(lyric),
        jsonLyric = Value(jsonLyric),
        notationHtml = Value(notationHtml);
  static Insertable<Hymn> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? textSize,
    Expression<bool>? favorite,
    Expression<double>? speed,
    Expression<String>? version,
    Expression<String>? lyric,
    Expression<String>? jsonLyric,
    Expression<String>? notationHtml,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (textSize != null) 'text_size': textSize,
      if (favorite != null) 'favorite': favorite,
      if (speed != null) 'speed': speed,
      if (version != null) 'version': version,
      if (lyric != null) 'lyric': lyric,
      if (jsonLyric != null) 'json_lyric': jsonLyric,
      if (notationHtml != null) 'notation_html': notationHtml,
    });
  }

  HymnsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<double>? textSize,
      Value<bool>? favorite,
      Value<double>? speed,
      Value<String>? version,
      Value<String>? lyric,
      Value<String>? jsonLyric,
      Value<String>? notationHtml}) {
    return HymnsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      textSize: textSize ?? this.textSize,
      favorite: favorite ?? this.favorite,
      speed: speed ?? this.speed,
      version: version ?? this.version,
      lyric: lyric ?? this.lyric,
      jsonLyric: jsonLyric ?? this.jsonLyric,
      notationHtml: notationHtml ?? this.notationHtml,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (textSize.present) {
      map['text_size'] = Variable<double>(textSize.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (lyric.present) {
      map['lyric'] = Variable<String>(lyric.value);
    }
    if (jsonLyric.present) {
      map['json_lyric'] = Variable<String>(jsonLyric.value);
    }
    if (notationHtml.present) {
      map['notation_html'] = Variable<String>(notationHtml.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HymnsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('textSize: $textSize, ')
          ..write('favorite: $favorite, ')
          ..write('speed: $speed, ')
          ..write('version: $version, ')
          ..write('lyric: $lyric, ')
          ..write('jsonLyric: $jsonLyric, ')
          ..write('notationHtml: $notationHtml')
          ..write(')'))
        .toString();
  }
}

class $HymnsTable extends Hymns with TableInfo<$HymnsTable, Hymn> {
  final GeneratedDatabase _db;
  final String? _alias;
  $HymnsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _textSizeMeta = const VerificationMeta('textSize');
  @override
  late final GeneratedColumn<double?> textSize = GeneratedColumn<double?>(
      'text_size', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _favoriteMeta = const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<bool?> favorite = GeneratedColumn<bool?>(
      'favorite', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (favorite IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double?> speed = GeneratedColumn<double?>(
      'speed', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _versionMeta = const VerificationMeta('version');
  @override
  late final GeneratedColumn<String?> version = GeneratedColumn<String?>(
      'version', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _lyricMeta = const VerificationMeta('lyric');
  @override
  late final GeneratedColumn<String?> lyric = GeneratedColumn<String?>(
      'lyric', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _jsonLyricMeta = const VerificationMeta('jsonLyric');
  @override
  late final GeneratedColumn<String?> jsonLyric = GeneratedColumn<String?>(
      'json_lyric', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _notationHtmlMeta =
      const VerificationMeta('notationHtml');
  @override
  late final GeneratedColumn<String?> notationHtml = GeneratedColumn<String?>(
      'notation_html', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        textSize,
        favorite,
        speed,
        version,
        lyric,
        jsonLyric,
        notationHtml
      ];
  @override
  String get aliasedName => _alias ?? 'hymns';
  @override
  String get actualTableName => 'hymns';
  @override
  VerificationContext validateIntegrity(Insertable<Hymn> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('text_size')) {
      context.handle(_textSizeMeta,
          textSize.isAcceptableOrUnknown(data['text_size']!, _textSizeMeta));
    } else if (isInserting) {
      context.missing(_textSizeMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    }
    if (data.containsKey('speed')) {
      context.handle(
          _speedMeta, speed.isAcceptableOrUnknown(data['speed']!, _speedMeta));
    } else if (isInserting) {
      context.missing(_speedMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('lyric')) {
      context.handle(
          _lyricMeta, lyric.isAcceptableOrUnknown(data['lyric']!, _lyricMeta));
    } else if (isInserting) {
      context.missing(_lyricMeta);
    }
    if (data.containsKey('json_lyric')) {
      context.handle(_jsonLyricMeta,
          jsonLyric.isAcceptableOrUnknown(data['json_lyric']!, _jsonLyricMeta));
    } else if (isInserting) {
      context.missing(_jsonLyricMeta);
    }
    if (data.containsKey('notation_html')) {
      context.handle(
          _notationHtmlMeta,
          notationHtml.isAcceptableOrUnknown(
              data['notation_html']!, _notationHtmlMeta));
    } else if (isInserting) {
      context.missing(_notationHtmlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Hymn map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Hymn.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $HymnsTable createAlias(String alias) {
    return $HymnsTable(_db, alias);
  }
}

class Liturgy extends DataClass implements Insertable<Liturgy> {
  final int id;
  final String title;
  final double textSize;
  final bool favorite;
  final double speed;
  final String version;
  final String content;
  final String contentJson;
  Liturgy(
      {required this.id,
      required this.title,
      required this.textSize,
      required this.favorite,
      required this.speed,
      required this.version,
      required this.content,
      required this.contentJson});
  factory Liturgy.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Liturgy(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      textSize: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}text_size'])!,
      favorite: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favorite'])!,
      speed: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}speed'])!,
      version: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}version'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      contentJson: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content_json'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['text_size'] = Variable<double>(textSize);
    map['favorite'] = Variable<bool>(favorite);
    map['speed'] = Variable<double>(speed);
    map['version'] = Variable<String>(version);
    map['content'] = Variable<String>(content);
    map['content_json'] = Variable<String>(contentJson);
    return map;
  }

  LiturgiesCompanion toCompanion(bool nullToAbsent) {
    return LiturgiesCompanion(
      id: Value(id),
      title: Value(title),
      textSize: Value(textSize),
      favorite: Value(favorite),
      speed: Value(speed),
      version: Value(version),
      content: Value(content),
      contentJson: Value(contentJson),
    );
  }

  factory Liturgy.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Liturgy(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      textSize: serializer.fromJson<double>(json['textSize']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      speed: serializer.fromJson<double>(json['speed']),
      version: serializer.fromJson<String>(json['version']),
      content: serializer.fromJson<String>(json['content']),
      contentJson: serializer.fromJson<String>(json['contentJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'textSize': serializer.toJson<double>(textSize),
      'favorite': serializer.toJson<bool>(favorite),
      'speed': serializer.toJson<double>(speed),
      'version': serializer.toJson<String>(version),
      'content': serializer.toJson<String>(content),
      'contentJson': serializer.toJson<String>(contentJson),
    };
  }

  Liturgy copyWith(
          {int? id,
          String? title,
          double? textSize,
          bool? favorite,
          double? speed,
          String? version,
          String? content,
          String? contentJson}) =>
      Liturgy(
        id: id ?? this.id,
        title: title ?? this.title,
        textSize: textSize ?? this.textSize,
        favorite: favorite ?? this.favorite,
        speed: speed ?? this.speed,
        version: version ?? this.version,
        content: content ?? this.content,
        contentJson: contentJson ?? this.contentJson,
      );
  @override
  String toString() {
    return (StringBuffer('Liturgy(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('textSize: $textSize, ')
          ..write('favorite: $favorite, ')
          ..write('speed: $speed, ')
          ..write('version: $version, ')
          ..write('content: $content, ')
          ..write('contentJson: $contentJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, textSize, favorite, speed, version, content, contentJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Liturgy &&
          other.id == this.id &&
          other.title == this.title &&
          other.textSize == this.textSize &&
          other.favorite == this.favorite &&
          other.speed == this.speed &&
          other.version == this.version &&
          other.content == this.content &&
          other.contentJson == this.contentJson);
}

class LiturgiesCompanion extends UpdateCompanion<Liturgy> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> textSize;
  final Value<bool> favorite;
  final Value<double> speed;
  final Value<String> version;
  final Value<String> content;
  final Value<String> contentJson;
  const LiturgiesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.textSize = const Value.absent(),
    this.favorite = const Value.absent(),
    this.speed = const Value.absent(),
    this.version = const Value.absent(),
    this.content = const Value.absent(),
    this.contentJson = const Value.absent(),
  });
  LiturgiesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double textSize,
    this.favorite = const Value.absent(),
    required double speed,
    required String version,
    required String content,
    required String contentJson,
  })  : title = Value(title),
        textSize = Value(textSize),
        speed = Value(speed),
        version = Value(version),
        content = Value(content),
        contentJson = Value(contentJson);
  static Insertable<Liturgy> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? textSize,
    Expression<bool>? favorite,
    Expression<double>? speed,
    Expression<String>? version,
    Expression<String>? content,
    Expression<String>? contentJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (textSize != null) 'text_size': textSize,
      if (favorite != null) 'favorite': favorite,
      if (speed != null) 'speed': speed,
      if (version != null) 'version': version,
      if (content != null) 'content': content,
      if (contentJson != null) 'content_json': contentJson,
    });
  }

  LiturgiesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<double>? textSize,
      Value<bool>? favorite,
      Value<double>? speed,
      Value<String>? version,
      Value<String>? content,
      Value<String>? contentJson}) {
    return LiturgiesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      textSize: textSize ?? this.textSize,
      favorite: favorite ?? this.favorite,
      speed: speed ?? this.speed,
      version: version ?? this.version,
      content: content ?? this.content,
      contentJson: contentJson ?? this.contentJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (textSize.present) {
      map['text_size'] = Variable<double>(textSize.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (contentJson.present) {
      map['content_json'] = Variable<String>(contentJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LiturgiesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('textSize: $textSize, ')
          ..write('favorite: $favorite, ')
          ..write('speed: $speed, ')
          ..write('version: $version, ')
          ..write('content: $content, ')
          ..write('contentJson: $contentJson')
          ..write(')'))
        .toString();
  }
}

class $LiturgiesTable extends Liturgies
    with TableInfo<$LiturgiesTable, Liturgy> {
  final GeneratedDatabase _db;
  final String? _alias;
  $LiturgiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _textSizeMeta = const VerificationMeta('textSize');
  @override
  late final GeneratedColumn<double?> textSize = GeneratedColumn<double?>(
      'text_size', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _favoriteMeta = const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<bool?> favorite = GeneratedColumn<bool?>(
      'favorite', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (favorite IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double?> speed = GeneratedColumn<double?>(
      'speed', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _versionMeta = const VerificationMeta('version');
  @override
  late final GeneratedColumn<String?> version = GeneratedColumn<String?>(
      'version', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentJsonMeta =
      const VerificationMeta('contentJson');
  @override
  late final GeneratedColumn<String?> contentJson = GeneratedColumn<String?>(
      'content_json', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, textSize, favorite, speed, version, content, contentJson];
  @override
  String get aliasedName => _alias ?? 'liturgies';
  @override
  String get actualTableName => 'liturgies';
  @override
  VerificationContext validateIntegrity(Insertable<Liturgy> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('text_size')) {
      context.handle(_textSizeMeta,
          textSize.isAcceptableOrUnknown(data['text_size']!, _textSizeMeta));
    } else if (isInserting) {
      context.missing(_textSizeMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    }
    if (data.containsKey('speed')) {
      context.handle(
          _speedMeta, speed.isAcceptableOrUnknown(data['speed']!, _speedMeta));
    } else if (isInserting) {
      context.missing(_speedMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('content_json')) {
      context.handle(
          _contentJsonMeta,
          contentJson.isAcceptableOrUnknown(
              data['content_json']!, _contentJsonMeta));
    } else if (isInserting) {
      context.missing(_contentJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Liturgy map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Liturgy.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LiturgiesTable createAlias(String alias) {
    return $LiturgiesTable(_db, alias);
  }
}

class Other extends DataClass implements Insertable<Other> {
  final int id;
  final String title;
  final double textSize;
  final bool favorite;
  final double speed;
  final String version;
  final String content;
  final String contentHtml;
  Other(
      {required this.id,
      required this.title,
      required this.textSize,
      required this.favorite,
      required this.speed,
      required this.version,
      required this.content,
      required this.contentHtml});
  factory Other.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Other(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      textSize: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}text_size'])!,
      favorite: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favorite'])!,
      speed: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}speed'])!,
      version: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}version'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      contentHtml: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content_html'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['text_size'] = Variable<double>(textSize);
    map['favorite'] = Variable<bool>(favorite);
    map['speed'] = Variable<double>(speed);
    map['version'] = Variable<String>(version);
    map['content'] = Variable<String>(content);
    map['content_html'] = Variable<String>(contentHtml);
    return map;
  }

  OthersCompanion toCompanion(bool nullToAbsent) {
    return OthersCompanion(
      id: Value(id),
      title: Value(title),
      textSize: Value(textSize),
      favorite: Value(favorite),
      speed: Value(speed),
      version: Value(version),
      content: Value(content),
      contentHtml: Value(contentHtml),
    );
  }

  factory Other.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Other(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      textSize: serializer.fromJson<double>(json['textSize']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      speed: serializer.fromJson<double>(json['speed']),
      version: serializer.fromJson<String>(json['version']),
      content: serializer.fromJson<String>(json['content']),
      contentHtml: serializer.fromJson<String>(json['contentHtml']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'textSize': serializer.toJson<double>(textSize),
      'favorite': serializer.toJson<bool>(favorite),
      'speed': serializer.toJson<double>(speed),
      'version': serializer.toJson<String>(version),
      'content': serializer.toJson<String>(content),
      'contentHtml': serializer.toJson<String>(contentHtml),
    };
  }

  Other copyWith(
          {int? id,
          String? title,
          double? textSize,
          bool? favorite,
          double? speed,
          String? version,
          String? content,
          String? contentHtml}) =>
      Other(
        id: id ?? this.id,
        title: title ?? this.title,
        textSize: textSize ?? this.textSize,
        favorite: favorite ?? this.favorite,
        speed: speed ?? this.speed,
        version: version ?? this.version,
        content: content ?? this.content,
        contentHtml: contentHtml ?? this.contentHtml,
      );
  @override
  String toString() {
    return (StringBuffer('Other(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('textSize: $textSize, ')
          ..write('favorite: $favorite, ')
          ..write('speed: $speed, ')
          ..write('version: $version, ')
          ..write('content: $content, ')
          ..write('contentHtml: $contentHtml')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, textSize, favorite, speed, version, content, contentHtml);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Other &&
          other.id == this.id &&
          other.title == this.title &&
          other.textSize == this.textSize &&
          other.favorite == this.favorite &&
          other.speed == this.speed &&
          other.version == this.version &&
          other.content == this.content &&
          other.contentHtml == this.contentHtml);
}

class OthersCompanion extends UpdateCompanion<Other> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> textSize;
  final Value<bool> favorite;
  final Value<double> speed;
  final Value<String> version;
  final Value<String> content;
  final Value<String> contentHtml;
  const OthersCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.textSize = const Value.absent(),
    this.favorite = const Value.absent(),
    this.speed = const Value.absent(),
    this.version = const Value.absent(),
    this.content = const Value.absent(),
    this.contentHtml = const Value.absent(),
  });
  OthersCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double textSize,
    this.favorite = const Value.absent(),
    required double speed,
    required String version,
    required String content,
    required String contentHtml,
  })  : title = Value(title),
        textSize = Value(textSize),
        speed = Value(speed),
        version = Value(version),
        content = Value(content),
        contentHtml = Value(contentHtml);
  static Insertable<Other> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? textSize,
    Expression<bool>? favorite,
    Expression<double>? speed,
    Expression<String>? version,
    Expression<String>? content,
    Expression<String>? contentHtml,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (textSize != null) 'text_size': textSize,
      if (favorite != null) 'favorite': favorite,
      if (speed != null) 'speed': speed,
      if (version != null) 'version': version,
      if (content != null) 'content': content,
      if (contentHtml != null) 'content_html': contentHtml,
    });
  }

  OthersCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<double>? textSize,
      Value<bool>? favorite,
      Value<double>? speed,
      Value<String>? version,
      Value<String>? content,
      Value<String>? contentHtml}) {
    return OthersCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      textSize: textSize ?? this.textSize,
      favorite: favorite ?? this.favorite,
      speed: speed ?? this.speed,
      version: version ?? this.version,
      content: content ?? this.content,
      contentHtml: contentHtml ?? this.contentHtml,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (textSize.present) {
      map['text_size'] = Variable<double>(textSize.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (contentHtml.present) {
      map['content_html'] = Variable<String>(contentHtml.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OthersCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('textSize: $textSize, ')
          ..write('favorite: $favorite, ')
          ..write('speed: $speed, ')
          ..write('version: $version, ')
          ..write('content: $content, ')
          ..write('contentHtml: $contentHtml')
          ..write(')'))
        .toString();
  }
}

class $OthersTable extends Others with TableInfo<$OthersTable, Other> {
  final GeneratedDatabase _db;
  final String? _alias;
  $OthersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _textSizeMeta = const VerificationMeta('textSize');
  @override
  late final GeneratedColumn<double?> textSize = GeneratedColumn<double?>(
      'text_size', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _favoriteMeta = const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<bool?> favorite = GeneratedColumn<bool?>(
      'favorite', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (favorite IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double?> speed = GeneratedColumn<double?>(
      'speed', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _versionMeta = const VerificationMeta('version');
  @override
  late final GeneratedColumn<String?> version = GeneratedColumn<String?>(
      'version', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentHtmlMeta =
      const VerificationMeta('contentHtml');
  @override
  late final GeneratedColumn<String?> contentHtml = GeneratedColumn<String?>(
      'content_html', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, textSize, favorite, speed, version, content, contentHtml];
  @override
  String get aliasedName => _alias ?? '"others"';
  @override
  String get actualTableName => '"others"';
  @override
  VerificationContext validateIntegrity(Insertable<Other> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('text_size')) {
      context.handle(_textSizeMeta,
          textSize.isAcceptableOrUnknown(data['text_size']!, _textSizeMeta));
    } else if (isInserting) {
      context.missing(_textSizeMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    }
    if (data.containsKey('speed')) {
      context.handle(
          _speedMeta, speed.isAcceptableOrUnknown(data['speed']!, _speedMeta));
    } else if (isInserting) {
      context.missing(_speedMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('content_html')) {
      context.handle(
          _contentHtmlMeta,
          contentHtml.isAcceptableOrUnknown(
              data['content_html']!, _contentHtmlMeta));
    } else if (isInserting) {
      context.missing(_contentHtmlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Other map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Other.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OthersTable createAlias(String alias) {
    return $OthersTable(_db, alias);
  }
}

class Prayer extends DataClass implements Insertable<Prayer> {
  final int id;
  final String title;
  final double textSize;
  final bool favorite;
  final double speed;
  final String version;
  final String content;
  final String contentHtml;
  Prayer(
      {required this.id,
      required this.title,
      required this.textSize,
      required this.favorite,
      required this.speed,
      required this.version,
      required this.content,
      required this.contentHtml});
  factory Prayer.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Prayer(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      textSize: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}text_size'])!,
      favorite: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favorite'])!,
      speed: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}speed'])!,
      version: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}version'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      contentHtml: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content_html'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['text_size'] = Variable<double>(textSize);
    map['favorite'] = Variable<bool>(favorite);
    map['speed'] = Variable<double>(speed);
    map['version'] = Variable<String>(version);
    map['content'] = Variable<String>(content);
    map['content_html'] = Variable<String>(contentHtml);
    return map;
  }

  PrayersCompanion toCompanion(bool nullToAbsent) {
    return PrayersCompanion(
      id: Value(id),
      title: Value(title),
      textSize: Value(textSize),
      favorite: Value(favorite),
      speed: Value(speed),
      version: Value(version),
      content: Value(content),
      contentHtml: Value(contentHtml),
    );
  }

  factory Prayer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Prayer(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      textSize: serializer.fromJson<double>(json['textSize']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      speed: serializer.fromJson<double>(json['speed']),
      version: serializer.fromJson<String>(json['version']),
      content: serializer.fromJson<String>(json['content']),
      contentHtml: serializer.fromJson<String>(json['contentHtml']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'textSize': serializer.toJson<double>(textSize),
      'favorite': serializer.toJson<bool>(favorite),
      'speed': serializer.toJson<double>(speed),
      'version': serializer.toJson<String>(version),
      'content': serializer.toJson<String>(content),
      'contentHtml': serializer.toJson<String>(contentHtml),
    };
  }

  Prayer copyWith(
          {int? id,
          String? title,
          double? textSize,
          bool? favorite,
          double? speed,
          String? version,
          String? content,
          String? contentHtml}) =>
      Prayer(
        id: id ?? this.id,
        title: title ?? this.title,
        textSize: textSize ?? this.textSize,
        favorite: favorite ?? this.favorite,
        speed: speed ?? this.speed,
        version: version ?? this.version,
        content: content ?? this.content,
        contentHtml: contentHtml ?? this.contentHtml,
      );
  @override
  String toString() {
    return (StringBuffer('Prayer(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('textSize: $textSize, ')
          ..write('favorite: $favorite, ')
          ..write('speed: $speed, ')
          ..write('version: $version, ')
          ..write('content: $content, ')
          ..write('contentHtml: $contentHtml')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, textSize, favorite, speed, version, content, contentHtml);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Prayer &&
          other.id == this.id &&
          other.title == this.title &&
          other.textSize == this.textSize &&
          other.favorite == this.favorite &&
          other.speed == this.speed &&
          other.version == this.version &&
          other.content == this.content &&
          other.contentHtml == this.contentHtml);
}

class PrayersCompanion extends UpdateCompanion<Prayer> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> textSize;
  final Value<bool> favorite;
  final Value<double> speed;
  final Value<String> version;
  final Value<String> content;
  final Value<String> contentHtml;
  const PrayersCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.textSize = const Value.absent(),
    this.favorite = const Value.absent(),
    this.speed = const Value.absent(),
    this.version = const Value.absent(),
    this.content = const Value.absent(),
    this.contentHtml = const Value.absent(),
  });
  PrayersCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double textSize,
    this.favorite = const Value.absent(),
    required double speed,
    required String version,
    required String content,
    required String contentHtml,
  })  : title = Value(title),
        textSize = Value(textSize),
        speed = Value(speed),
        version = Value(version),
        content = Value(content),
        contentHtml = Value(contentHtml);
  static Insertable<Prayer> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? textSize,
    Expression<bool>? favorite,
    Expression<double>? speed,
    Expression<String>? version,
    Expression<String>? content,
    Expression<String>? contentHtml,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (textSize != null) 'text_size': textSize,
      if (favorite != null) 'favorite': favorite,
      if (speed != null) 'speed': speed,
      if (version != null) 'version': version,
      if (content != null) 'content': content,
      if (contentHtml != null) 'content_html': contentHtml,
    });
  }

  PrayersCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<double>? textSize,
      Value<bool>? favorite,
      Value<double>? speed,
      Value<String>? version,
      Value<String>? content,
      Value<String>? contentHtml}) {
    return PrayersCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      textSize: textSize ?? this.textSize,
      favorite: favorite ?? this.favorite,
      speed: speed ?? this.speed,
      version: version ?? this.version,
      content: content ?? this.content,
      contentHtml: contentHtml ?? this.contentHtml,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (textSize.present) {
      map['text_size'] = Variable<double>(textSize.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (contentHtml.present) {
      map['content_html'] = Variable<String>(contentHtml.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayersCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('textSize: $textSize, ')
          ..write('favorite: $favorite, ')
          ..write('speed: $speed, ')
          ..write('version: $version, ')
          ..write('content: $content, ')
          ..write('contentHtml: $contentHtml')
          ..write(')'))
        .toString();
  }
}

class $PrayersTable extends Prayers with TableInfo<$PrayersTable, Prayer> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PrayersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _textSizeMeta = const VerificationMeta('textSize');
  @override
  late final GeneratedColumn<double?> textSize = GeneratedColumn<double?>(
      'text_size', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _favoriteMeta = const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<bool?> favorite = GeneratedColumn<bool?>(
      'favorite', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (favorite IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double?> speed = GeneratedColumn<double?>(
      'speed', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _versionMeta = const VerificationMeta('version');
  @override
  late final GeneratedColumn<String?> version = GeneratedColumn<String?>(
      'version', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentHtmlMeta =
      const VerificationMeta('contentHtml');
  @override
  late final GeneratedColumn<String?> contentHtml = GeneratedColumn<String?>(
      'content_html', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, textSize, favorite, speed, version, content, contentHtml];
  @override
  String get aliasedName => _alias ?? 'prayers';
  @override
  String get actualTableName => 'prayers';
  @override
  VerificationContext validateIntegrity(Insertable<Prayer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('text_size')) {
      context.handle(_textSizeMeta,
          textSize.isAcceptableOrUnknown(data['text_size']!, _textSizeMeta));
    } else if (isInserting) {
      context.missing(_textSizeMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    }
    if (data.containsKey('speed')) {
      context.handle(
          _speedMeta, speed.isAcceptableOrUnknown(data['speed']!, _speedMeta));
    } else if (isInserting) {
      context.missing(_speedMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('content_html')) {
      context.handle(
          _contentHtmlMeta,
          contentHtml.isAcceptableOrUnknown(
              data['content_html']!, _contentHtmlMeta));
    } else if (isInserting) {
      context.missing(_contentHtmlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Prayer map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Prayer.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PrayersTable createAlias(String alias) {
    return $PrayersTable(_db, alias);
  }
}

class Psalm extends DataClass implements Insertable<Psalm> {
  final int id;
  final String title;
  final double textSize;
  final bool favorite;
  final double speed;
  final String version;
  final String content;
  final String contentHtml;
  Psalm(
      {required this.id,
      required this.title,
      required this.textSize,
      required this.favorite,
      required this.speed,
      required this.version,
      required this.content,
      required this.contentHtml});
  factory Psalm.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Psalm(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      textSize: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}text_size'])!,
      favorite: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favorite'])!,
      speed: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}speed'])!,
      version: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}version'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      contentHtml: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content_html'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['text_size'] = Variable<double>(textSize);
    map['favorite'] = Variable<bool>(favorite);
    map['speed'] = Variable<double>(speed);
    map['version'] = Variable<String>(version);
    map['content'] = Variable<String>(content);
    map['content_html'] = Variable<String>(contentHtml);
    return map;
  }

  PsalmsCompanion toCompanion(bool nullToAbsent) {
    return PsalmsCompanion(
      id: Value(id),
      title: Value(title),
      textSize: Value(textSize),
      favorite: Value(favorite),
      speed: Value(speed),
      version: Value(version),
      content: Value(content),
      contentHtml: Value(contentHtml),
    );
  }

  factory Psalm.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Psalm(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      textSize: serializer.fromJson<double>(json['textSize']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      speed: serializer.fromJson<double>(json['speed']),
      version: serializer.fromJson<String>(json['version']),
      content: serializer.fromJson<String>(json['content']),
      contentHtml: serializer.fromJson<String>(json['contentHtml']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'textSize': serializer.toJson<double>(textSize),
      'favorite': serializer.toJson<bool>(favorite),
      'speed': serializer.toJson<double>(speed),
      'version': serializer.toJson<String>(version),
      'content': serializer.toJson<String>(content),
      'contentHtml': serializer.toJson<String>(contentHtml),
    };
  }

  Psalm copyWith(
          {int? id,
          String? title,
          double? textSize,
          bool? favorite,
          double? speed,
          String? version,
          String? content,
          String? contentHtml}) =>
      Psalm(
        id: id ?? this.id,
        title: title ?? this.title,
        textSize: textSize ?? this.textSize,
        favorite: favorite ?? this.favorite,
        speed: speed ?? this.speed,
        version: version ?? this.version,
        content: content ?? this.content,
        contentHtml: contentHtml ?? this.contentHtml,
      );
  @override
  String toString() {
    return (StringBuffer('Psalm(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('textSize: $textSize, ')
          ..write('favorite: $favorite, ')
          ..write('speed: $speed, ')
          ..write('version: $version, ')
          ..write('content: $content, ')
          ..write('contentHtml: $contentHtml')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, textSize, favorite, speed, version, content, contentHtml);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Psalm &&
          other.id == this.id &&
          other.title == this.title &&
          other.textSize == this.textSize &&
          other.favorite == this.favorite &&
          other.speed == this.speed &&
          other.version == this.version &&
          other.content == this.content &&
          other.contentHtml == this.contentHtml);
}

class PsalmsCompanion extends UpdateCompanion<Psalm> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> textSize;
  final Value<bool> favorite;
  final Value<double> speed;
  final Value<String> version;
  final Value<String> content;
  final Value<String> contentHtml;
  const PsalmsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.textSize = const Value.absent(),
    this.favorite = const Value.absent(),
    this.speed = const Value.absent(),
    this.version = const Value.absent(),
    this.content = const Value.absent(),
    this.contentHtml = const Value.absent(),
  });
  PsalmsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double textSize,
    this.favorite = const Value.absent(),
    required double speed,
    required String version,
    required String content,
    required String contentHtml,
  })  : title = Value(title),
        textSize = Value(textSize),
        speed = Value(speed),
        version = Value(version),
        content = Value(content),
        contentHtml = Value(contentHtml);
  static Insertable<Psalm> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? textSize,
    Expression<bool>? favorite,
    Expression<double>? speed,
    Expression<String>? version,
    Expression<String>? content,
    Expression<String>? contentHtml,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (textSize != null) 'text_size': textSize,
      if (favorite != null) 'favorite': favorite,
      if (speed != null) 'speed': speed,
      if (version != null) 'version': version,
      if (content != null) 'content': content,
      if (contentHtml != null) 'content_html': contentHtml,
    });
  }

  PsalmsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<double>? textSize,
      Value<bool>? favorite,
      Value<double>? speed,
      Value<String>? version,
      Value<String>? content,
      Value<String>? contentHtml}) {
    return PsalmsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      textSize: textSize ?? this.textSize,
      favorite: favorite ?? this.favorite,
      speed: speed ?? this.speed,
      version: version ?? this.version,
      content: content ?? this.content,
      contentHtml: contentHtml ?? this.contentHtml,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (textSize.present) {
      map['text_size'] = Variable<double>(textSize.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (speed.present) {
      map['speed'] = Variable<double>(speed.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (contentHtml.present) {
      map['content_html'] = Variable<String>(contentHtml.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PsalmsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('textSize: $textSize, ')
          ..write('favorite: $favorite, ')
          ..write('speed: $speed, ')
          ..write('version: $version, ')
          ..write('content: $content, ')
          ..write('contentHtml: $contentHtml')
          ..write(')'))
        .toString();
  }
}

class $PsalmsTable extends Psalms with TableInfo<$PsalmsTable, Psalm> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PsalmsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _textSizeMeta = const VerificationMeta('textSize');
  @override
  late final GeneratedColumn<double?> textSize = GeneratedColumn<double?>(
      'text_size', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _favoriteMeta = const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<bool?> favorite = GeneratedColumn<bool?>(
      'favorite', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (favorite IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<double?> speed = GeneratedColumn<double?>(
      'speed', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _versionMeta = const VerificationMeta('version');
  @override
  late final GeneratedColumn<String?> version = GeneratedColumn<String?>(
      'version', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentHtmlMeta =
      const VerificationMeta('contentHtml');
  @override
  late final GeneratedColumn<String?> contentHtml = GeneratedColumn<String?>(
      'content_html', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, textSize, favorite, speed, version, content, contentHtml];
  @override
  String get aliasedName => _alias ?? 'psalms';
  @override
  String get actualTableName => 'psalms';
  @override
  VerificationContext validateIntegrity(Insertable<Psalm> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('text_size')) {
      context.handle(_textSizeMeta,
          textSize.isAcceptableOrUnknown(data['text_size']!, _textSizeMeta));
    } else if (isInserting) {
      context.missing(_textSizeMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    }
    if (data.containsKey('speed')) {
      context.handle(
          _speedMeta, speed.isAcceptableOrUnknown(data['speed']!, _speedMeta));
    } else if (isInserting) {
      context.missing(_speedMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('content_html')) {
      context.handle(
          _contentHtmlMeta,
          contentHtml.isAcceptableOrUnknown(
              data['content_html']!, _contentHtmlMeta));
    } else if (isInserting) {
      context.missing(_contentHtmlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Psalm map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Psalm.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PsalmsTable createAlias(String alias) {
    return $PsalmsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $BooksTable books = $BooksTable(this);
  late final $HymnsTable hymns = $HymnsTable(this);
  late final $LiturgiesTable liturgies = $LiturgiesTable(this);
  late final $OthersTable others = $OthersTable(this);
  late final $PrayersTable prayers = $PrayersTable(this);
  late final $PsalmsTable psalms = $PsalmsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [books, hymns, liturgies, others, prayers, psalms];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$HymnDaoMixin on DatabaseAccessor<AppDatabase> {
  $HymnsTable get hymns => attachedDatabase.hymns;
}
mixin _$PsalmDaoMixin on DatabaseAccessor<AppDatabase> {
  $PsalmsTable get psalms => attachedDatabase.psalms;
}
mixin _$OtherDaoMixin on DatabaseAccessor<AppDatabase> {
  $OthersTable get others => attachedDatabase.others;
}
mixin _$PrayerDaoMixin on DatabaseAccessor<AppDatabase> {
  $PrayersTable get prayers => attachedDatabase.prayers;
}
mixin _$LiturgyDaoMixin on DatabaseAccessor<AppDatabase> {
  $LiturgiesTable get liturgies => attachedDatabase.liturgies;
}
