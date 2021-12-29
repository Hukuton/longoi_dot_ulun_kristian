// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translated_hymn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslatedHymn _$TranslatedHymnFromJson(Map<String, dynamic> json) =>
    TranslatedHymn(
      language: json['language'] as String,
      title: json['title'] as String,
      lyrics: (json['lyric'] as List<dynamic>)
          .map((e) => Lyric.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TranslatedHymnToJson(TranslatedHymn instance) =>
    <String, dynamic>{
      'language': instance.language,
      'title': instance.title,
      'lyric': instance.lyrics,
    };
