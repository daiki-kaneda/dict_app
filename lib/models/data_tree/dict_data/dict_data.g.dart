// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dict_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DictData _$DictDataFromJson(Map<String, dynamic> json) => DictData(
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      audioPath: json['audioPath'] as String,
      description: json['description'] as String?,
      isFavorite: json['isFavorite'] as bool,
      duration: (json['duration'] as num).toDouble(),
      transcript: json['transcript'] as String,
      paragraphs: DictationParagraphs.fromJson(
          json['paragraphs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DictDataToJson(DictData instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'createdAt': instance.createdAt.toIso8601String(),
    'audioPath': instance.audioPath,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  val['isFavorite'] = instance.isFavorite;
  val['duration'] = instance.duration;
  val['transcript'] = instance.transcript;
  val['paragraphs'] = instance.paragraphs.toJson();
  return val;
}
