import 'package:json_annotation/json_annotation.dart';

part 'lyric.g.dart';

//flutter packages pub run build_runner build

@JsonSerializable()

/// I was too lazy to learn json_serializable enum
/// #### 0 : intro
/// #### 1 : verse
/// #### 2 : pre chorus
/// #### 3 : chorus
/// #### 4 : bridge
/// #### 5 : just lyric
class Lyric {
  int type;
  String text;

  Lyric({required this.type, required this.text});

  factory Lyric.fromJson(Map<String, dynamic> json) => _$LyricFromJson(json);

  Map<String, dynamic> toJson() => _$LyricToJson(this);

  @override
  String toString() => 'Lyric{type: $type, text: $text}';

// Lyric.fromJson(Map<String, dynamic> json) {
//   type = json['type'];
//   text = json['text'];
// }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['type'] = type;
//   data['text'] = text;
//   return data;
// }
}
