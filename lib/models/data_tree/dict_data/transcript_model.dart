import 'package:json_annotation/json_annotation.dart';

part 'transcript_model.g.dart';

@JsonSerializable()
class TranscriptModel {
  final Metadata metadata;
  final List<Channel> channels;

  TranscriptModel({
    required this.metadata,
    required this.channels,
  });

  factory TranscriptModel.fromJson(Map<String, dynamic> json) =>
      _$TranscriptModelFromJson(json);

  Map<String, dynamic> toJson() => _$TranscriptModelToJson(this);
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: 'transaction_key')
  final String transactionKey;
  @JsonKey(name: 'request_id')
  final String requestId;
  final String sha256;
  final DateTime created;
  final double duration;
  final int channels;
  final List<String> models;
  final ModelInfo modelInfo;

  Metadata({
    required this.transactionKey,
    required this.requestId,
    required this.sha256,
    required this.created,
    required this.duration,
    required this.channels,
    required this.models,
    required this.modelInfo,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class ModelInfo {
  final Map<String, Model> models;

  ModelInfo({
    required this.models,
  });

  factory ModelInfo.fromJson(Map<String, dynamic> json) =>
      _$ModelInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ModelInfoToJson(this);
}

@JsonSerializable()
class Model {
  final String name;
  final String version;
  final String arch;

  Model({
    required this.name,
    required this.version,
    required this.arch,
  });

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

@JsonSerializable()
class Channel {
  final List<Alternative> alternatives;

  Channel({
    required this.alternatives,
  });

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}

@JsonSerializable()
class Alternative {
  final String transcript;
  final double confidence;
  final List<Word> words;
  final Paragraphs paragraphs;

  Alternative({
    required this.transcript,
    required this.confidence,
    required this.words,
    required this.paragraphs,
  });

  factory Alternative.fromJson(Map<String, dynamic> json) =>
      _$AlternativeFromJson(json);

  Map<String, dynamic> toJson() => _$AlternativeToJson(this);
}

@JsonSerializable()
class Word {
  final String word;
  final double start;
  final double end;
  final double confidence;
  @JsonKey(name: 'punctuated_word')
  final String punctuatedWord;

  Word({
    required this.word,
    required this.start,
    required this.end,
    required this.confidence,
    required this.punctuatedWord,
  });

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);
}

@JsonSerializable()
class Paragraphs {
  final String transcript;
  final List<Paragraph> paragraphs;

  Paragraphs({
    required this.transcript,
    required this.paragraphs,
  });

  factory Paragraphs.fromJson(Map<String, dynamic> json) =>
      _$ParagraphsFromJson(json);

  Map<String, dynamic> toJson() => _$ParagraphsToJson(this);
}

@JsonSerializable()
class Paragraph {
  final List<Sentence> sentences;
  @JsonKey(name: 'num_words')
  final int numWords;
  final double start;
  final double end;

  Paragraph({
    required this.sentences,
    required this.numWords,
    required this.start,
    required this.end,
  });

  factory Paragraph.fromJson(Map<String, dynamic> json) =>
      _$ParagraphFromJson(json);

  Map<String, dynamic> toJson() => _$ParagraphToJson(this);
}

@JsonSerializable()
class Sentence {
  final String text;
  final double start;
  final double end;

  Sentence({
    required this.text,
    required this.start,
    required this.end,
  });

  factory Sentence.fromJson(Map<String, dynamic> json) =>
      _$SentenceFromJson(json);

  Map<String, dynamic> toJson() => _$SentenceToJson(this);
}
