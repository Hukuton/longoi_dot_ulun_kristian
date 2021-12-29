import 'package:json_annotation/json_annotation.dart';

import 'content.dart';

part 'section.g.dart';

@JsonSerializable()
class Section {
  @JsonKey(name: 'section_title')
  String sectionTitle;
  @JsonKey(name: 'content')
  List<Content> content;

  Section({required this.sectionTitle, required this.content});

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);

  Map<String, dynamic> toJson() => _$SectionToJson(this);

  @override
  String toString() => 'Section{content: $content}';
}
