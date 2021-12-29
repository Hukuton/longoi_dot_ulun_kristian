import 'package:json_annotation/json_annotation.dart';
import 'package:longoi_dot_ulun_kristian/json_to_data/liturgy/section.dart';

part 'liturgy_model.g.dart';

//flutter packages pub run build_runner build
@JsonSerializable()
class LiturgyModel {
  String title;
  String intro;
  @JsonKey(name: 'section')
  List<Section> section;

  LiturgyModel(
      {required this.title, required this.intro, required this.section});

  factory LiturgyModel.fromJson(Map<String, dynamic> json) =>
      _$LiturgyModelFromJson(json);

  Map<String, dynamic> toJson() => _$LiturgyModelToJson(this);

  @override
  String toString() =>
      'LiturgyModel{title: $title, intro: $intro, section: $section}';
}
