// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dict_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DictData _$DictDataFromJson(Map<String, dynamic> json) => DictData(
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String?,
      isFavorite: json['isFavorite'] as bool,
      duration: (json['duration'] as num).toDouble(),
      transcript: json['transcript'] as String,
      words: (json['words'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
      paragraph: Paragraphs.fromJson(json['paragraph'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DictDataToJson(DictData instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'createdAt': instance.createdAt.toIso8601String(),
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
  val['words'] = instance.words.map((e) => e.toJson()).toList();
  val['paragraph'] = instance.paragraph.toJson();
  return val;
}
