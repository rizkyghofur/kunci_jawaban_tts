// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'JawabanDetailResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JawabanDetailResponse _$JawabanDetailResponseFromJson(
    Map<String, dynamic> json) {
  return JawabanDetailResponse(
    stars: json['stars'] as int,
    word: json['word'] as String,
    clue: json['clue'] as String,
  );
}

Map<String, dynamic> _$JawabanDetailResponseToJson(
        JawabanDetailResponse instance) =>
    <String, dynamic>{
      'stars': instance.stars,
      'word': instance.word,
      'clue': instance.clue,
    };
