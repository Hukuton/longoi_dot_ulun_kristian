import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@JsonSerializable()
class Content {
  String header;
  String paragraph;

  Content({required this.header, required this.paragraph});

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);

  @override
  String toString() => 'Content{header: $header, paragraph: $paragraph}';
}
