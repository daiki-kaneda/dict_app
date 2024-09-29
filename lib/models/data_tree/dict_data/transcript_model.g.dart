// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcript_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranscriptModel _$TranscriptModelFromJson(Map<String, dynamic> json) =>
    TranscriptModel(
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      channels: (json['channels'] as List<dynamic>)
          .map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TranscriptModelToJson(TranscriptModel instance) =>
    <String, dynamic>{
      'metadata': instance.metadata.toJson(),
      'channels': instance.channels.map((e) => e.toJson()).toList(),
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      transactionKey: json['transaction_key'] as String,
      requestId: json['request_id'] as String,
      sha256: json['sha256'] as String,
      created: DateTime.parse(json['created'] as String),
      duration: (json['duration'] as num).toDouble(),
      channels: (json['channels'] as num).toInt(),
      models:
          (json['models'] as List<dynamic>).map((e) => e as String).toList(),
      modelInfo: ModelInfo.fromJson(json['modelInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'transaction_key': instance.transactionKey,
      'request_id': instance.requestId,
      'sha256': instance.sha256,
      'created': instance.created.toIso8601String(),
      'duration': instance.duration,
      'channels': instance.channels,
      'models': instance.models,
      'modelInfo': instance.modelInfo.toJson(),
    };

ModelInfo _$ModelInfoFromJson(Map<String, dynamic> json) => ModelInfo(
      models: (json['models'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Model.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ModelInfoToJson(ModelInfo instance) => <String, dynamic>{
      'models': instance.models.map((k, e) => MapEntry(k, e.toJson())),
    };

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      name: json['name'] as String,
      version: json['version'] as String,
      arch: json['arch'] as String,
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'arch': instance.arch,
    };

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      alternatives: (json['alternatives'] as List<dynamic>)
          .map((e) => Alternative.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'alternatives': instance.alternatives.map((e) => e.toJson()).toList(),
    };

Alternative _$AlternativeFromJson(Map<String, dynamic> json) => Alternative(
      transcript: json['transcript'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      words: (json['words'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
      paragraphs:
          Paragraphs.fromJson(json['paragraphs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlternativeToJson(Alternative instance) =>
    <String, dynamic>{
      'transcript': instance.transcript,
      'confidence': instance.confidence,
      'words': instance.words.map((e) => e.toJson()).toList(),
      'paragraphs': instance.paragraphs.toJson(),
    };

Word _$WordFromJson(Map<String, dynamic> json) => Word(
      word: json['word'] as String,
      start: (json['start'] as num).toDouble(),
      end: (json['end'] as num).toDouble(),
      confidence: (json['confidence'] as num).toDouble(),
      punctuatedWord: json['punctuated_word'] as String,
    );

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'word': instance.word,
      'start': instance.start,
      'end': instance.end,
      'confidence': instance.confidence,
      'punctuated_word': instance.punctuatedWord,
    };

Paragraphs _$ParagraphsFromJson(Map<String, dynamic> json) => Paragraphs(
      transcript: json['transcript'] as String,
      paragraphs: (json['paragraphs'] as List<dynamic>)
          .map((e) => Paragraph.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ParagraphsToJson(Paragraphs instance) =>
    <String, dynamic>{
      'transcript': instance.transcript,
      'paragraphs': instance.paragraphs.map((e) => e.toJson()).toList(),
    };

Paragraph _$ParagraphFromJson(Map<String, dynamic> json) => Paragraph(
      sentences: (json['sentences'] as List<dynamic>)
          .map((e) => Sentence.fromJson(e as Map<String, dynamic>))
          .toList(),
      numWords: (json['num_words'] as num).toInt(),
      start: (json['start'] as num).toDouble(),
      end: (json['end'] as num).toDouble(),
    );

Map<String, dynamic> _$ParagraphToJson(Paragraph instance) => <String, dynamic>{
      'sentences': instance.sentences.map((e) => e.toJson()).toList(),
      'num_words': instance.numWords,
      'start': instance.start,
      'end': instance.end,
    };

Sentence _$SentenceFromJson(Map<String, dynamic> json) => Sentence(
      text: json['text'] as String,
      start: (json['start'] as num).toDouble(),
      end: (json['end'] as num).toDouble(),
    );

Map<String, dynamic> _$SentenceToJson(Sentence instance) => <String, dynamic>{
      'text': instance.text,
      'start': instance.start,
      'end': instance.end,
    };
