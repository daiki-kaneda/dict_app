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
      transcriptModel: json['transcriptModel'] == null
          ? null
          : TranscriptModel.fromJson(
              json['transcriptModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DictDataToJson(DictData instance) => <String, dynamic>{
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
      'audioPath': instance.audioPath,
      if (instance.description case final value?) 'description': value,
      'isFavorite': instance.isFavorite,
      'duration': instance.duration,
      'transcript': instance.transcript,
      'paragraphs': instance.paragraphs.toJson(),
      if (instance.transcriptModel?.toJson() case final value?)
        'transcriptModel': value,
    };
