import 'package:json_annotation/json_annotation.dart';
import 'package:kunci_jawaban_tts/models/responses/JawabanDetailResponse.dart';

part 'CariDataResponse.g.dart';

@JsonSerializable()
class CariDataResponse {
  String title;
  int total;
  List<JawabanDetailResponse> answers;

  CariDataResponse({this.title, this.total, this.answers});

  Map<String, dynamic> toJson() => _$CariDataResponseToJson(this);

  static CariDataResponse fromJson(Map<String, dynamic> json) =>
      _$CariDataResponseFromJson(json);
}
