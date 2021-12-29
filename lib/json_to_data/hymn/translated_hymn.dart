import 'package:json_annotation/json_annotation.dart';

import 'lyric.dart';

part 'translated_hymn.g.dart';

@JsonSerializable()
class TranslatedHymn {
  String language;
  String title;
  @JsonKey(name: 'lyric')
  List<Lyric> lyrics;

  TranslatedHymn(
      {required this.language, required this.title, required this.lyrics});

  factory TranslatedHymn.fromJson(Map<String, dynamic> json) =>
      _$TranslatedHymnFromJson(json);

  Map<String, dynamic> toJson() => _$TranslatedHymnToJson(this);

  @override
  String toString() =>
      'TranslatedHymn{language: $language, title: $title, lyrics: $lyrics}';

// TranslatedHymn.fromJson(Map<String, dynamic> json) {
//   language = json['language'];
//   if (json['lyric'] != null) {
//     lyrics = [];
//     json['lyric'].forEach((v) {
//       lyrics.add(Lyric.fromJson(v));
//     });
//   }
//   title = json['title'];
// }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['language'] = language;
//   data['lyric'] = lyrics.map((v) => v.toJson()).toList();
//   data['title'] = title;
//   return data;
// }
}
