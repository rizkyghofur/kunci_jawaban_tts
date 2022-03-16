import 'package:json_annotation/json_annotation.dart';

part 'JawabanDetailResponse.g.dart';

@JsonSerializable()
class JawabanDetailResponse {
  int stars;
  String word;
  String clue;

  JawabanDetailResponse({this.stars, this.word, this.clue});

  Map<String, dynamic> toJson() => _$JawabanDetailResponseToJson(this);

  static JawabanDetailResponse fromJson(Map<String, dynamic> json) =>
      _$JawabanDetailResponseFromJson(json);
}
