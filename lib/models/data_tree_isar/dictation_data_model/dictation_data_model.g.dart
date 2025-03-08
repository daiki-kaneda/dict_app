// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictation_data_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DictationParagraphsSchema = Schema(
  name: r'DictationParagraphs',
  id: -6983200758593886302,
  properties: {
    r'displayText': PropertySchema(
      id: 0,
      name: r'displayText',
      type: IsarType.string,
    ),
    r'getAllSentences': PropertySchema(
      id: 1,
      name: r'getAllSentences',
      type: IsarType.objectList,
      target: r'DictationSentence',
    ),
    r'isCompleted': PropertySchema(
      id: 2,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'paragraphs': PropertySchema(
      id: 3,
      name: r'paragraphs',
      type: IsarType.objectList,
      target: r'DictationParagraph',
    )
  },
  estimateSize: _dictationParagraphsEstimateSize,
  serialize: _dictationParagraphsSerialize,
  deserialize: _dictationParagraphsDeserialize,
  deserializeProp: _dictationParagraphsDeserializeProp,
);

int _dictationParagraphsEstimateSize(
  DictationParagraphs object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.displayText.length * 3;
  {
    final list = object.getAllSentences;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[DictationSentence]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              DictationSentenceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.paragraphs;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[DictationParagraph]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              DictationParagraphSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _dictationParagraphsSerialize(
  DictationParagraphs object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.displayText);
  writer.writeObjectList<DictationSentence>(
    offsets[1],
    allOffsets,
    DictationSentenceSchema.serialize,
    object.getAllSentences,
  );
  writer.writeBool(offsets[2], object.isCompleted);
  writer.writeObjectList<DictationParagraph>(
    offsets[3],
    allOffsets,
    DictationParagraphSchema.serialize,
    object.paragraphs,
  );
}

DictationParagraphs _dictationParagraphsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DictationParagraphs(
    paragraphs: reader.readObjectList<DictationParagraph>(
      offsets[3],
      DictationParagraphSchema.deserialize,
      allOffsets,
      DictationParagraph(),
    ),
  );
  return object;
}

P _dictationParagraphsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectList<DictationSentence>(
        offset,
        DictationSentenceSchema.deserialize,
        allOffsets,
        DictationSentence(),
      )) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readObjectList<DictationParagraph>(
        offset,
        DictationParagraphSchema.deserialize,
        allOffsets,
        DictationParagraph(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DictationParagraphsQueryFilter on QueryBuilder<DictationParagraphs,
    DictationParagraphs, QFilterCondition> {
  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      displayTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      displayTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      displayTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      displayTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      displayTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      displayTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      displayTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      displayTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      displayTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayText',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      displayTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayText',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      getAllSentencesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'getAllSentences',
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      getAllSentencesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'getAllSentences',
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      getAllSentencesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'getAllSentences',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      getAllSentencesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'getAllSentences',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      getAllSentencesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'getAllSentences',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      getAllSentencesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'getAllSentences',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      getAllSentencesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'getAllSentences',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      getAllSentencesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'getAllSentences',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      paragraphsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paragraphs',
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      paragraphsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paragraphs',
      ));
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      paragraphsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'paragraphs',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      paragraphsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'paragraphs',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      paragraphsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'paragraphs',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      paragraphsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'paragraphs',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      paragraphsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'paragraphs',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      paragraphsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'paragraphs',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension DictationParagraphsQueryObject on QueryBuilder<DictationParagraphs,
    DictationParagraphs, QFilterCondition> {
  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      getAllSentencesElement(FilterQuery<DictationSentence> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'getAllSentences');
    });
  }

  QueryBuilder<DictationParagraphs, DictationParagraphs, QAfterFilterCondition>
      paragraphsElement(FilterQuery<DictationParagraph> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'paragraphs');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DictationParagraphSchema = Schema(
  name: r'DictationParagraph',
  id: -1052782010084208865,
  properties: {
    r'displayText': PropertySchema(
      id: 0,
      name: r'displayText',
      type: IsarType.string,
    ),
    r'end': PropertySchema(
      id: 1,
      name: r'end',
      type: IsarType.double,
    ),
    r'isCompleted': PropertySchema(
      id: 2,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'sentences': PropertySchema(
      id: 3,
      name: r'sentences',
      type: IsarType.objectList,
      target: r'DictationSentence',
    ),
    r'start': PropertySchema(
      id: 4,
      name: r'start',
      type: IsarType.double,
    )
  },
  estimateSize: _dictationParagraphEstimateSize,
  serialize: _dictationParagraphSerialize,
  deserialize: _dictationParagraphDeserialize,
  deserializeProp: _dictationParagraphDeserializeProp,
);

int _dictationParagraphEstimateSize(
  DictationParagraph object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.displayText.length * 3;
  {
    final list = object.sentences;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[DictationSentence]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              DictationSentenceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _dictationParagraphSerialize(
  DictationParagraph object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.displayText);
  writer.writeDouble(offsets[1], object.end);
  writer.writeBool(offsets[2], object.isCompleted);
  writer.writeObjectList<DictationSentence>(
    offsets[3],
    allOffsets,
    DictationSentenceSchema.serialize,
    object.sentences,
  );
  writer.writeDouble(offsets[4], object.start);
}

DictationParagraph _dictationParagraphDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DictationParagraph(
    end: reader.readDoubleOrNull(offsets[1]),
    sentences: reader.readObjectList<DictationSentence>(
      offsets[3],
      DictationSentenceSchema.deserialize,
      allOffsets,
      DictationSentence(),
    ),
    start: reader.readDoubleOrNull(offsets[4]),
  );
  return object;
}

P _dictationParagraphDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readObjectList<DictationSentence>(
        offset,
        DictationSentenceSchema.deserialize,
        allOffsets,
        DictationSentence(),
      )) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DictationParagraphQueryFilter
    on QueryBuilder<DictationParagraph, DictationParagraph, QFilterCondition> {
  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      displayTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      displayTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      displayTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      displayTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      displayTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      displayTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      displayTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      displayTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      displayTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayText',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      displayTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayText',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      endIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'end',
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      endIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'end',
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      endEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'end',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      endGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'end',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      endLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'end',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      endBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'end',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      sentencesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sentences',
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      sentencesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sentences',
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      sentencesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sentences',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      sentencesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sentences',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      sentencesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sentences',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      sentencesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sentences',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      sentencesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sentences',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      sentencesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sentences',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      startIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'start',
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      startIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'start',
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      startEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      startGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'start',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      startLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'start',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      startBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'start',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension DictationParagraphQueryObject
    on QueryBuilder<DictationParagraph, DictationParagraph, QFilterCondition> {
  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      sentencesElement(FilterQuery<DictationSentence> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sentences');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DictationSentenceSchema = Schema(
  name: r'DictationSentence',
  id: 1830829723399133458,
  properties: {
    r'displayText': PropertySchema(
      id: 0,
      name: r'displayText',
      type: IsarType.string,
    ),
    r'end': PropertySchema(
      id: 1,
      name: r'end',
      type: IsarType.double,
    ),
    r'isCompleted': PropertySchema(
      id: 2,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'sentence': PropertySchema(
      id: 3,
      name: r'sentence',
      type: IsarType.string,
    ),
    r'start': PropertySchema(
      id: 4,
      name: r'start',
      type: IsarType.double,
    ),
    r'words': PropertySchema(
      id: 5,
      name: r'words',
      type: IsarType.objectList,
      target: r'DictationWord',
    )
  },
  estimateSize: _dictationSentenceEstimateSize,
  serialize: _dictationSentenceSerialize,
  deserialize: _dictationSentenceDeserialize,
  deserializeProp: _dictationSentenceDeserializeProp,
);

int _dictationSentenceEstimateSize(
  DictationSentence object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.displayText.length * 3;
  {
    final value = object.sentence;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.words;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[DictationWord]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              DictationWordSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _dictationSentenceSerialize(
  DictationSentence object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.displayText);
  writer.writeDouble(offsets[1], object.end);
  writer.writeBool(offsets[2], object.isCompleted);
  writer.writeString(offsets[3], object.sentence);
  writer.writeDouble(offsets[4], object.start);
  writer.writeObjectList<DictationWord>(
    offsets[5],
    allOffsets,
    DictationWordSchema.serialize,
    object.words,
  );
}

DictationSentence _dictationSentenceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DictationSentence(
    end: reader.readDoubleOrNull(offsets[1]),
    sentence: reader.readStringOrNull(offsets[3]),
    start: reader.readDoubleOrNull(offsets[4]),
    words: reader.readObjectList<DictationWord>(
      offsets[5],
      DictationWordSchema.deserialize,
      allOffsets,
      DictationWord(),
    ),
  );
  return object;
}

P _dictationSentenceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readObjectList<DictationWord>(
        offset,
        DictationWordSchema.deserialize,
        allOffsets,
        DictationWord(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DictationSentenceQueryFilter
    on QueryBuilder<DictationSentence, DictationSentence, QFilterCondition> {
  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      displayTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      displayTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      displayTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      displayTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      displayTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      displayTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      displayTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      displayTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      displayTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayText',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      displayTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayText',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      endIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'end',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      endIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'end',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      endEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'end',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      endGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'end',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      endLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'end',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      endBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'end',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      sentenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sentence',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      sentenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sentence',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      sentenceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sentence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      sentenceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sentence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      sentenceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sentence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      sentenceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sentence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      sentenceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sentence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      sentenceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sentence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      sentenceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sentence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      sentenceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sentence',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      sentenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sentence',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      sentenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sentence',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      startIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'start',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      startIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'start',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      startEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      startGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'start',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      startLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'start',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      startBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'start',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      wordsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'words',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      wordsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'words',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      wordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'words',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      wordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'words',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      wordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'words',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      wordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'words',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      wordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'words',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      wordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'words',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension DictationSentenceQueryObject
    on QueryBuilder<DictationSentence, DictationSentence, QFilterCondition> {
  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      wordsElement(FilterQuery<DictationWord> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'words');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DictationWordSchema = Schema(
  name: r'DictationWord',
  id: -712638523791849784,
  properties: {
    r'characters': PropertySchema(
      id: 0,
      name: r'characters',
      type: IsarType.objectList,
      target: r'DictationCharacter',
    ),
    r'displayText': PropertySchema(
      id: 1,
      name: r'displayText',
      type: IsarType.string,
    ),
    r'end': PropertySchema(
      id: 2,
      name: r'end',
      type: IsarType.double,
    ),
    r'isCompleted': PropertySchema(
      id: 3,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'start': PropertySchema(
      id: 4,
      name: r'start',
      type: IsarType.double,
    ),
    r'word': PropertySchema(
      id: 5,
      name: r'word',
      type: IsarType.string,
    )
  },
  estimateSize: _dictationWordEstimateSize,
  serialize: _dictationWordSerialize,
  deserialize: _dictationWordDeserialize,
  deserializeProp: _dictationWordDeserializeProp,
);

int _dictationWordEstimateSize(
  DictationWord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.characters;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[DictationCharacter]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              DictationCharacterSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  bytesCount += 3 + object.displayText.length * 3;
  {
    final value = object.word;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dictationWordSerialize(
  DictationWord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<DictationCharacter>(
    offsets[0],
    allOffsets,
    DictationCharacterSchema.serialize,
    object.characters,
  );
  writer.writeString(offsets[1], object.displayText);
  writer.writeDouble(offsets[2], object.end);
  writer.writeBool(offsets[3], object.isCompleted);
  writer.writeDouble(offsets[4], object.start);
  writer.writeString(offsets[5], object.word);
}

DictationWord _dictationWordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DictationWord(
    characters: reader.readObjectList<DictationCharacter>(
      offsets[0],
      DictationCharacterSchema.deserialize,
      allOffsets,
      DictationCharacter(),
    ),
    end: reader.readDoubleOrNull(offsets[2]),
    start: reader.readDoubleOrNull(offsets[4]),
    word: reader.readStringOrNull(offsets[5]),
  );
  return object;
}

P _dictationWordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<DictationCharacter>(
        offset,
        DictationCharacterSchema.deserialize,
        allOffsets,
        DictationCharacter(),
      )) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DictationWordQueryFilter
    on QueryBuilder<DictationWord, DictationWord, QFilterCondition> {
  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      charactersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'characters',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      charactersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'characters',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      charactersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'characters',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      charactersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'characters',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      charactersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'characters',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      charactersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'characters',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      charactersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'characters',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      charactersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'characters',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      displayTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      displayTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      displayTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      displayTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      displayTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      displayTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      displayTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      displayTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      displayTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayText',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      displayTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayText',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      endIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'end',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      endIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'end',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition> endEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'end',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      endGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'end',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition> endLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'end',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition> endBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'end',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      startIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'start',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      startIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'start',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      startEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      startGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'start',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      startLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'start',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      startBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'start',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      wordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'word',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      wordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'word',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition> wordEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      wordGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      wordLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition> wordBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'word',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      wordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      wordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      wordContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition> wordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'word',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      wordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'word',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      wordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'word',
        value: '',
      ));
    });
  }
}

extension DictationWordQueryObject
    on QueryBuilder<DictationWord, DictationWord, QFilterCondition> {
  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      charactersElement(FilterQuery<DictationCharacter> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'characters');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DictationCharacterSchema = Schema(
  name: r'DictationCharacter',
  id: -3393547679616256319,
  properties: {
    r'character': PropertySchema(
      id: 0,
      name: r'character',
      type: IsarType.string,
    ),
    r'isSolved': PropertySchema(
      id: 1,
      name: r'isSolved',
      type: IsarType.bool,
    )
  },
  estimateSize: _dictationCharacterEstimateSize,
  serialize: _dictationCharacterSerialize,
  deserialize: _dictationCharacterDeserialize,
  deserializeProp: _dictationCharacterDeserializeProp,
);

int _dictationCharacterEstimateSize(
  DictationCharacter object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.character;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dictationCharacterSerialize(
  DictationCharacter object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.character);
  writer.writeBool(offsets[1], object.isSolved);
}

DictationCharacter _dictationCharacterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DictationCharacter(
    character: reader.readStringOrNull(offsets[0]),
    isSolved: reader.readBoolOrNull(offsets[1]) ?? false,
  );
  return object;
}

P _dictationCharacterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DictationCharacterQueryFilter
    on QueryBuilder<DictationCharacter, DictationCharacter, QFilterCondition> {
  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      characterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'character',
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      characterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'character',
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      characterEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'character',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      characterGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'character',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      characterLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'character',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      characterBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'character',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      characterStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'character',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      characterEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'character',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      characterContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'character',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      characterMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'character',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      characterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'character',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      characterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'character',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      isSolvedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSolved',
        value: value,
      ));
    });
  }
}

extension DictationCharacterQueryObject
    on QueryBuilder<DictationCharacter, DictationCharacter, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DictationParagraphs _$DictationParagraphsFromJson(Map<String, dynamic> json) =>
    DictationParagraphs(
      paragraphs: (json['paragraphs'] as List<dynamic>?)
          ?.map((e) => DictationParagraph.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DictationParagraphsToJson(DictationParagraphs instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'paragraphs', instance.paragraphs?.map((e) => e.toJson()).toList());
  return val;
}

DictationParagraph _$DictationParagraphFromJson(Map<String, dynamic> json) =>
    DictationParagraph(
      sentences: (json['sentences'] as List<dynamic>?)
          ?.map((e) => DictationSentence.fromJson(e as Map<String, dynamic>))
          .toList(),
      start: (json['start'] as num?)?.toDouble(),
      end: (json['end'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DictationParagraphToJson(DictationParagraph instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'sentences', instance.sentences?.map((e) => e.toJson()).toList());
  writeNotNull('start', instance.start);
  writeNotNull('end', instance.end);
  return val;
}

DictationSentence _$DictationSentenceFromJson(Map<String, dynamic> json) =>
    DictationSentence(
      sentence: json['sentence'] as String?,
      words: (json['words'] as List<dynamic>?)
          ?.map((e) => DictationWord.fromJson(e as Map<String, dynamic>))
          .toList(),
      start: (json['start'] as num?)?.toDouble(),
      end: (json['end'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DictationSentenceToJson(DictationSentence instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sentence', instance.sentence);
  writeNotNull('words', instance.words?.map((e) => e.toJson()).toList());
  writeNotNull('start', instance.start);
  writeNotNull('end', instance.end);
  return val;
}

DictationWord _$DictationWordFromJson(Map<String, dynamic> json) =>
    DictationWord(
      word: json['word'] as String?,
      characters: (json['characters'] as List<dynamic>?)
          ?.map((e) => DictationCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
      start: (json['start'] as num?)?.toDouble(),
      end: (json['end'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DictationWordToJson(DictationWord instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('word', instance.word);
  writeNotNull(
      'characters', instance.characters?.map((e) => e.toJson()).toList());
  writeNotNull('start', instance.start);
  writeNotNull('end', instance.end);
  return val;
}

DictationCharacter _$DictationCharacterFromJson(Map<String, dynamic> json) =>
    DictationCharacter(
      character: json['character'] as String?,
      isSolved: json['isSolved'] as bool? ?? false,
    );

Map<String, dynamic> _$DictationCharacterToJson(DictationCharacter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('character', instance.character);
  val['isSolved'] = instance.isSolved;
  return val;
}
