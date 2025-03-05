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

Map<String, dynamic> _$TranscriptModelToJson(TranscriptModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata?.toJson());
  writeNotNull('results', instance.results?.toJson());
  return val;
}

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

Map<String, dynamic> _$MetadataToJson(Metadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('transaction_key', instance.transactionKey);
  writeNotNull('request_id', instance.requestId);
  writeNotNull('sha256', instance.sha256);
  writeNotNull('created', instance.created?.toIso8601String());
  writeNotNull('duration', instance.duration);
  writeNotNull('channels', instance.channels);
  writeNotNull('models', instance.models);
  writeNotNull('modelInfo', instance.modelInfo?.toJson());
  return val;
}

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      channels: (json['channels'] as List<dynamic>?)
          ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('channels', instance.channels?.map((e) => e.toJson()).toList());
  return val;
}

ModelInfo _$ModelInfoFromJson(Map<String, dynamic> json) => ModelInfo(
      models: (json['models'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Model.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ModelInfoToJson(ModelInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'models', instance.models?.map((k, e) => MapEntry(k, e.toJson())));
  return val;
}

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      name: json['name'] as String?,
      version: json['version'] as String?,
      arch: json['arch'] as String?,
    );

Map<String, dynamic> _$ModelToJson(Model instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('version', instance.version);
  writeNotNull('arch', instance.arch);
  return val;
}

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      alternatives: (json['alternatives'] as List<dynamic>?)
          ?.map((e) => Alternative.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'alternatives', instance.alternatives?.map((e) => e.toJson()).toList());
  return val;
}

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

Map<String, dynamic> _$AlternativeToJson(Alternative instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('transcript', instance.transcript);
  writeNotNull('confidence', instance.confidence);
  writeNotNull('words', instance.words?.map((e) => e.toJson()).toList());
  writeNotNull('paragraphs', instance.paragraphs?.toJson());
  return val;
}

Word _$WordFromJson(Map<String, dynamic> json) => Word(
      word: json['word'] as String?,
      start: (json['start'] as num?)?.toDouble(),
      end: (json['end'] as num?)?.toDouble(),
      confidence: (json['confidence'] as num?)?.toDouble(),
      punctuatedWord: json['punctuated_word'] as String?,
    );

Map<String, dynamic> _$WordToJson(Word instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('word', instance.word);
  writeNotNull('start', instance.start);
  writeNotNull('end', instance.end);
  writeNotNull('confidence', instance.confidence);
  writeNotNull('punctuated_word', instance.punctuatedWord);
  return val;
}

Paragraphs _$ParagraphsFromJson(Map<String, dynamic> json) => Paragraphs(
      transcript: json['transcript'] as String?,
      paragraphs: (json['paragraphs'] as List<dynamic>?)
          ?.map((e) => Paragraph.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ParagraphsToJson(Paragraphs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('transcript', instance.transcript);
  writeNotNull(
      'paragraphs', instance.paragraphs?.map((e) => e.toJson()).toList());
  return val;
}

Paragraph _$ParagraphFromJson(Map<String, dynamic> json) => Paragraph(
      sentences: (json['sentences'] as List<dynamic>?)
          ?.map((e) => Sentence.fromJson(e as Map<String, dynamic>))
          .toList(),
      numWords: (json['num_words'] as num?)?.toInt(),
      start: (json['start'] as num?)?.toDouble(),
      end: (json['end'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ParagraphToJson(Paragraph instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'sentences', instance.sentences?.map((e) => e.toJson()).toList());
  writeNotNull('num_words', instance.numWords);
  writeNotNull('start', instance.start);
  writeNotNull('end', instance.end);
  return val;
}

Sentence _$SentenceFromJson(Map<String, dynamic> json) => Sentence(
      text: json['text'] as String?,
      start: (json['start'] as num?)?.toDouble(),
      end: (json['end'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SentenceToJson(Sentence instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('start', instance.start);
  writeNotNull('end', instance.end);
  return val;
}
