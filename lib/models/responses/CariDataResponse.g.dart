// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CariDataResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariDataResponse _$CariDataResponseFromJson(Map<String, dynamic> json) {
  return CariDataResponse(
    title: json['title'] as String,
    total: json['total'] as int,
    answers: (json['answers'] as List)
        ?.map((e) => e == null
            ? null
            : JawabanDetailResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CariDataResponseToJson(CariDataResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'total': instance.total,
      'answer': instance.answers,
    };
