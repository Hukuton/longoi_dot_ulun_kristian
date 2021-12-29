// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liturgy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiturgyModel _$LiturgyModelFromJson(Map<String, dynamic> json) => LiturgyModel(
      title: json['title'] as String,
      intro: json['intro'] as String,
      section: (json['section'] as List<dynamic>)
          .map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LiturgyModelToJson(LiturgyModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'intro': instance.intro,
      'section': instance.section,
    };
