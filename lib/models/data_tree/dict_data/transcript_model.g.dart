// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcript_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranscriptModel _$TranscriptModelFromJson(Map<String, dynamic> json) =>
    TranscriptModel(
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      results: json['results'] == null
          ? null
          : Results.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TranscriptModelToJson(TranscriptModel instance) =>
    <String, dynamic>{
      if (instance.metadata?.toJson() case final value?) 'metadata': value,
      if (instance.results?.toJson() case final value?) 'results': value,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      transactionKey: json['transaction_key'] as String?,
      requestId: json['request_id'] as String?,
      sha256: json['sha256'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      duration: (json['duration'] as num?)?.toDouble(),
      channels: (json['channels'] as num?)?.toInt(),
      models:
          (json['models'] as List<dynamic>?)?.map((e) => e as String).toList(),
      modelInfo: json['modelInfo'] == null
          ? null
          : ModelInfo.fromJson(json['modelInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      if (instance.transactionKey case final value?) 'transaction_key': value,
      if (instance.requestId case final value?) 'request_id': value,
      if (instance.sha256 case final value?) 'sha256': value,
      if (instance.created?.toIso8601String() case final value?)
        'created': value,
      if (instance.duration case final value?) 'duration': value,
      if (instance.channels case final value?) 'channels': value,
      if (instance.models case final value?) 'models': value,
      if (instance.modelInfo?.toJson() case final value?) 'modelInfo': value,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      channels: (json['channels'] as List<dynamic>?)
          ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      if (instance.channels?.map((e) => e.toJson()).toList() case final value?)
        'channels': value,
    };

ModelInfo _$ModelInfoFromJson(Map<String, dynamic> json) => ModelInfo(
      models: (json['models'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Model.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ModelInfoToJson(ModelInfo instance) => <String, dynamic>{
      if (instance.models?.map((k, e) => MapEntry(k, e.toJson()))
          case final value?)
        'models': value,
    };

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      name: json['name'] as String?,
      version: json['version'] as String?,
      arch: json['arch'] as String?,
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.version case final value?) 'version': value,
      if (instance.arch case final value?) 'arch': value,
    };

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      alternatives: (json['alternatives'] as List<dynamic>?)
          ?.map((e) => Alternative.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      if (instance.alternatives?.map((e) => e.toJson()).toList()
          case final value?)
        'alternatives': value,
    };

Alternative _$AlternativeFromJson(Map<String, dynamic> json) => Alternative(
      transcript: json['transcript'] as String?,
      confidence: (json['confidence'] as num?)?.toDouble(),
      words: (json['words'] as List<dynamic>?)
          ?.map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
      paragraphs: json['paragraphs'] == null
          ? null
          : Paragraphs.fromJson(json['paragraphs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlternativeToJson(Alternative instance) =>
    <String, dynamic>{
      if (instance.transcript case final value?) 'transcript': value,
      if (instance.confidence case final value?) 'confidence': value,
      if (instance.words?.map((e) => e.toJson()).toList() case final value?)
        'words': value,
      if (instance.paragraphs?.toJson() case final value?) 'paragraphs': value,
    };

Word _$WordFromJson(Map<String, dynamic> json) => Word(
      word: json['word'] as String?,
      start: (json['start'] as num?)?.toDouble(),
      end: (json['end'] as num?)?.toDouble(),
      confidence: (json['confidence'] as num?)?.toDouble(),
      punctuatedWord: json['punctuated_word'] as String?,
    );

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      if (instance.word case final value?) 'word': value,
      if (instance.start case final value?) 'start': value,
      if (instance.end case final value?) 'end': value,
      if (instance.confidence case final value?) 'confidence': value,
      if (instance.punctuatedWord case final value?) 'punctuated_word': value,
    };

Paragraphs _$ParagraphsFromJson(Map<String, dynamic> json) => Paragraphs(
      transcript: json['transcript'] as String?,
      paragraphs: (json['paragraphs'] as List<dynamic>?)
          ?.map((e) => Paragraph.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ParagraphsToJson(Paragraphs instance) =>
    <String, dynamic>{
      if (instance.transcript case final value?) 'transcript': value,
      if (instance.paragraphs?.map((e) => e.toJson()).toList()
          case final value?)
        'paragraphs': value,
    };

Paragraph _$ParagraphFromJson(Map<String, dynamic> json) => Paragraph(
      sentences: (json['sentences'] as List<dynamic>?)
          ?.map((e) => Sentence.fromJson(e as Map<String, dynamic>))
          .toList(),
      numWords: (json['num_words'] as num?)?.toInt(),
      start: (json['start'] as num?)?.toDouble(),
      end: (json['end'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ParagraphToJson(Paragraph instance) => <String, dynamic>{
      if (instance.sentences?.map((e) => e.toJson()).toList() case final value?)
        'sentences': value,
      if (instance.numWords case final value?) 'num_words': value,
      if (instance.start case final value?) 'start': value,
      if (instance.end case final value?) 'end': value,
    };

Sentence _$SentenceFromJson(Map<String, dynamic> json) => Sentence(
      text: json['text'] as String?,
      start: (json['start'] as num?)?.toDouble(),
      end: (json['end'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SentenceToJson(Sentence instance) => <String, dynamic>{
      if (instance.text case final value?) 'text': value,
      if (instance.start case final value?) 'start': value,
      if (instance.end case final value?) 'end': value,
    };
