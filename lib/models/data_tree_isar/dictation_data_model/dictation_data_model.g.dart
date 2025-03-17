// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictation_data_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DictationSectionSchema = Schema(
  name: r'DictationSection',
  id: -1549784492033707822,
  properties: {
    r'accuracy': PropertySchema(
      id: 0,
      name: r'accuracy',
      type: IsarType.double,
    ),
    r'allCharacters': PropertySchema(
      id: 1,
      name: r'allCharacters',
      type: IsarType.objectList,
      target: r'DictationCharacter',
    ),
    r'displayText': PropertySchema(
      id: 2,
      name: r'displayText',
      type: IsarType.string,
    ),
    r'firstUnsolvedIndex': PropertySchema(
      id: 3,
      name: r'firstUnsolvedIndex',
      type: IsarType.long,
    ),
    r'getAllSentences': PropertySchema(
      id: 4,
      name: r'getAllSentences',
      type: IsarType.objectList,
      target: r'DictationSentence',
    ),
    r'index': PropertySchema(
      id: 5,
      name: r'index',
      type: IsarType.long,
    ),
    r'isCompleted': PropertySchema(
      id: 6,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'paragraphs': PropertySchema(
      id: 7,
      name: r'paragraphs',
      type: IsarType.objectList,
      target: r'DictationParagraph',
    ),
    r'parentIndex': PropertySchema(
      id: 8,
      name: r'parentIndex',
      type: IsarType.long,
    )
  },
  estimateSize: _dictationSectionEstimateSize,
  serialize: _dictationSectionSerialize,
  deserialize: _dictationSectionDeserialize,
  deserializeProp: _dictationSectionDeserializeProp,
);

int _dictationSectionEstimateSize(
  DictationSection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.allCharacters.length * 3;
  {
    final offsets = allOffsets[DictationCharacter]!;
    for (var i = 0; i < object.allCharacters.length; i++) {
      final value = object.allCharacters[i];
      bytesCount +=
          DictationCharacterSchema.estimateSize(value, offsets, allOffsets);
    }
  }
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

void _dictationSectionSerialize(
  DictationSection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.accuracy);
  writer.writeObjectList<DictationCharacter>(
    offsets[1],
    allOffsets,
    DictationCharacterSchema.serialize,
    object.allCharacters,
  );
  writer.writeString(offsets[2], object.displayText);
  writer.writeLong(offsets[3], object.firstUnsolvedIndex);
  writer.writeObjectList<DictationSentence>(
    offsets[4],
    allOffsets,
    DictationSentenceSchema.serialize,
    object.getAllSentences,
  );
  writer.writeLong(offsets[5], object.index);
  writer.writeBool(offsets[6], object.isCompleted);
  writer.writeObjectList<DictationParagraph>(
    offsets[7],
    allOffsets,
    DictationParagraphSchema.serialize,
    object.paragraphs,
  );
  writer.writeLong(offsets[8], object.parentIndex);
}

DictationSection _dictationSectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DictationSection(
    index: reader.readLongOrNull(offsets[5]),
    paragraphs: reader.readObjectList<DictationParagraph>(
      offsets[7],
      DictationParagraphSchema.deserialize,
      allOffsets,
      DictationParagraph(),
    ),
    parentIndex: reader.readLongOrNull(offsets[8]),
  );
  return object;
}

P _dictationSectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readObjectList<DictationCharacter>(
            offset,
            DictationCharacterSchema.deserialize,
            allOffsets,
            DictationCharacter(),
          ) ??
          []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readObjectList<DictationSentence>(
        offset,
        DictationSentenceSchema.deserialize,
        allOffsets,
        DictationSentence(),
      )) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readObjectList<DictationParagraph>(
        offset,
        DictationParagraphSchema.deserialize,
        allOffsets,
        DictationParagraph(),
      )) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DictationSectionQueryFilter
    on QueryBuilder<DictationSection, DictationSection, QFilterCondition> {
  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      accuracyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      accuracyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      accuracyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      accuracyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accuracy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      allCharactersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      allCharactersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      allCharactersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      allCharactersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      allCharactersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      allCharactersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      displayTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      displayTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      displayTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayText',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      displayTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayText',
        value: '',
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      firstUnsolvedIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstUnsolvedIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      firstUnsolvedIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstUnsolvedIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      firstUnsolvedIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstUnsolvedIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      firstUnsolvedIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstUnsolvedIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      getAllSentencesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'getAllSentences',
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      getAllSentencesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'getAllSentences',
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      indexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'index',
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      indexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'index',
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      indexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      indexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      indexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      indexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'index',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      paragraphsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paragraphs',
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      paragraphsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paragraphs',
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      parentIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentIndex',
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      parentIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentIndex',
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      parentIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      parentIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      parentIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      parentIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DictationSectionQueryObject
    on QueryBuilder<DictationSection, DictationSection, QFilterCondition> {
  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      allCharactersElement(FilterQuery<DictationCharacter> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'allCharacters');
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
      getAllSentencesElement(FilterQuery<DictationSentence> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'getAllSentences');
    });
  }

  QueryBuilder<DictationSection, DictationSection, QAfterFilterCondition>
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
    r'accuracy': PropertySchema(
      id: 0,
      name: r'accuracy',
      type: IsarType.double,
    ),
    r'allCharacters': PropertySchema(
      id: 1,
      name: r'allCharacters',
      type: IsarType.objectList,
      target: r'DictationCharacter',
    ),
    r'displayText': PropertySchema(
      id: 2,
      name: r'displayText',
      type: IsarType.string,
    ),
    r'end': PropertySchema(
      id: 3,
      name: r'end',
      type: IsarType.double,
    ),
    r'firstUnsolvedIndex': PropertySchema(
      id: 4,
      name: r'firstUnsolvedIndex',
      type: IsarType.long,
    ),
    r'index': PropertySchema(
      id: 5,
      name: r'index',
      type: IsarType.long,
    ),
    r'isCompleted': PropertySchema(
      id: 6,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'parentIndex': PropertySchema(
      id: 7,
      name: r'parentIndex',
      type: IsarType.long,
    ),
    r'sentences': PropertySchema(
      id: 8,
      name: r'sentences',
      type: IsarType.objectList,
      target: r'DictationSentence',
    ),
    r'start': PropertySchema(
      id: 9,
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
  bytesCount += 3 + object.allCharacters.length * 3;
  {
    final offsets = allOffsets[DictationCharacter]!;
    for (var i = 0; i < object.allCharacters.length; i++) {
      final value = object.allCharacters[i];
      bytesCount +=
          DictationCharacterSchema.estimateSize(value, offsets, allOffsets);
    }
  }
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
  writer.writeDouble(offsets[0], object.accuracy);
  writer.writeObjectList<DictationCharacter>(
    offsets[1],
    allOffsets,
    DictationCharacterSchema.serialize,
    object.allCharacters,
  );
  writer.writeString(offsets[2], object.displayText);
  writer.writeDouble(offsets[3], object.end);
  writer.writeLong(offsets[4], object.firstUnsolvedIndex);
  writer.writeLong(offsets[5], object.index);
  writer.writeBool(offsets[6], object.isCompleted);
  writer.writeLong(offsets[7], object.parentIndex);
  writer.writeObjectList<DictationSentence>(
    offsets[8],
    allOffsets,
    DictationSentenceSchema.serialize,
    object.sentences,
  );
  writer.writeDouble(offsets[9], object.start);
}

DictationParagraph _dictationParagraphDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DictationParagraph(
    end: reader.readDoubleOrNull(offsets[3]),
    index: reader.readLongOrNull(offsets[5]),
    parentIndex: reader.readLongOrNull(offsets[7]),
    sentences: reader.readObjectList<DictationSentence>(
      offsets[8],
      DictationSentenceSchema.deserialize,
      allOffsets,
      DictationSentence(),
    ),
    start: reader.readDoubleOrNull(offsets[9]),
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
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readObjectList<DictationCharacter>(
            offset,
            DictationCharacterSchema.deserialize,
            allOffsets,
            DictationCharacter(),
          ) ??
          []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readObjectList<DictationSentence>(
        offset,
        DictationSentenceSchema.deserialize,
        allOffsets,
        DictationSentence(),
      )) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DictationParagraphQueryFilter
    on QueryBuilder<DictationParagraph, DictationParagraph, QFilterCondition> {
  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      accuracyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      accuracyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      accuracyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      accuracyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accuracy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      allCharactersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      allCharactersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      allCharactersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      allCharactersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      allCharactersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      allCharactersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

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
      firstUnsolvedIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstUnsolvedIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      firstUnsolvedIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstUnsolvedIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      firstUnsolvedIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstUnsolvedIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      firstUnsolvedIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstUnsolvedIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      indexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'index',
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      indexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'index',
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      indexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      indexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      indexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      indexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'index',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
      parentIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentIndex',
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      parentIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentIndex',
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      parentIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      parentIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      parentIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationParagraph, DictationParagraph, QAfterFilterCondition>
      parentIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
      allCharactersElement(FilterQuery<DictationCharacter> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'allCharacters');
    });
  }

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
    r'accuracy': PropertySchema(
      id: 0,
      name: r'accuracy',
      type: IsarType.double,
    ),
    r'allCharacters': PropertySchema(
      id: 1,
      name: r'allCharacters',
      type: IsarType.objectList,
      target: r'DictationCharacter',
    ),
    r'displayText': PropertySchema(
      id: 2,
      name: r'displayText',
      type: IsarType.string,
    ),
    r'end': PropertySchema(
      id: 3,
      name: r'end',
      type: IsarType.double,
    ),
    r'firstUnsolvedIndex': PropertySchema(
      id: 4,
      name: r'firstUnsolvedIndex',
      type: IsarType.long,
    ),
    r'index': PropertySchema(
      id: 5,
      name: r'index',
      type: IsarType.long,
    ),
    r'isCompleted': PropertySchema(
      id: 6,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'parentIndex': PropertySchema(
      id: 7,
      name: r'parentIndex',
      type: IsarType.long,
    ),
    r'sentence': PropertySchema(
      id: 8,
      name: r'sentence',
      type: IsarType.string,
    ),
    r'start': PropertySchema(
      id: 9,
      name: r'start',
      type: IsarType.double,
    ),
    r'words': PropertySchema(
      id: 10,
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
  bytesCount += 3 + object.allCharacters.length * 3;
  {
    final offsets = allOffsets[DictationCharacter]!;
    for (var i = 0; i < object.allCharacters.length; i++) {
      final value = object.allCharacters[i];
      bytesCount +=
          DictationCharacterSchema.estimateSize(value, offsets, allOffsets);
    }
  }
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
  writer.writeDouble(offsets[0], object.accuracy);
  writer.writeObjectList<DictationCharacter>(
    offsets[1],
    allOffsets,
    DictationCharacterSchema.serialize,
    object.allCharacters,
  );
  writer.writeString(offsets[2], object.displayText);
  writer.writeDouble(offsets[3], object.end);
  writer.writeLong(offsets[4], object.firstUnsolvedIndex);
  writer.writeLong(offsets[5], object.index);
  writer.writeBool(offsets[6], object.isCompleted);
  writer.writeLong(offsets[7], object.parentIndex);
  writer.writeString(offsets[8], object.sentence);
  writer.writeDouble(offsets[9], object.start);
  writer.writeObjectList<DictationWord>(
    offsets[10],
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
    end: reader.readDoubleOrNull(offsets[3]),
    index: reader.readLongOrNull(offsets[5]),
    parentIndex: reader.readLongOrNull(offsets[7]),
    sentence: reader.readStringOrNull(offsets[8]),
    start: reader.readDoubleOrNull(offsets[9]),
    words: reader.readObjectList<DictationWord>(
      offsets[10],
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
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readObjectList<DictationCharacter>(
            offset,
            DictationCharacterSchema.deserialize,
            allOffsets,
            DictationCharacter(),
          ) ??
          []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
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
      accuracyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      accuracyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      accuracyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      accuracyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accuracy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      allCharactersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      allCharactersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      allCharactersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      allCharactersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      allCharactersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      allCharactersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allCharacters',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

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
      firstUnsolvedIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstUnsolvedIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      firstUnsolvedIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstUnsolvedIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      firstUnsolvedIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstUnsolvedIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      firstUnsolvedIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstUnsolvedIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      indexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'index',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      indexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'index',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      indexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      indexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      indexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      indexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'index',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
      parentIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentIndex',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      parentIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentIndex',
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      parentIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      parentIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      parentIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationSentence, DictationSentence, QAfterFilterCondition>
      parentIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
      allCharactersElement(FilterQuery<DictationCharacter> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'allCharacters');
    });
  }

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
    r'accuracy': PropertySchema(
      id: 0,
      name: r'accuracy',
      type: IsarType.double,
    ),
    r'characters': PropertySchema(
      id: 1,
      name: r'characters',
      type: IsarType.objectList,
      target: r'DictationCharacter',
    ),
    r'displayText': PropertySchema(
      id: 2,
      name: r'displayText',
      type: IsarType.string,
    ),
    r'end': PropertySchema(
      id: 3,
      name: r'end',
      type: IsarType.double,
    ),
    r'firstUnsolvedIndex': PropertySchema(
      id: 4,
      name: r'firstUnsolvedIndex',
      type: IsarType.long,
    ),
    r'index': PropertySchema(
      id: 5,
      name: r'index',
      type: IsarType.long,
    ),
    r'isCompleted': PropertySchema(
      id: 6,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'parentIndex': PropertySchema(
      id: 7,
      name: r'parentIndex',
      type: IsarType.long,
    ),
    r'start': PropertySchema(
      id: 8,
      name: r'start',
      type: IsarType.double,
    ),
    r'word': PropertySchema(
      id: 9,
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
  writer.writeDouble(offsets[0], object.accuracy);
  writer.writeObjectList<DictationCharacter>(
    offsets[1],
    allOffsets,
    DictationCharacterSchema.serialize,
    object.characters,
  );
  writer.writeString(offsets[2], object.displayText);
  writer.writeDouble(offsets[3], object.end);
  writer.writeLong(offsets[4], object.firstUnsolvedIndex);
  writer.writeLong(offsets[5], object.index);
  writer.writeBool(offsets[6], object.isCompleted);
  writer.writeLong(offsets[7], object.parentIndex);
  writer.writeDouble(offsets[8], object.start);
  writer.writeString(offsets[9], object.word);
}

DictationWord _dictationWordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DictationWord(
    characters: reader.readObjectList<DictationCharacter>(
      offsets[1],
      DictationCharacterSchema.deserialize,
      allOffsets,
      DictationCharacter(),
    ),
    end: reader.readDoubleOrNull(offsets[3]),
    index: reader.readLongOrNull(offsets[5]),
    parentIndex: reader.readLongOrNull(offsets[7]),
    start: reader.readDoubleOrNull(offsets[8]),
    word: reader.readStringOrNull(offsets[9]),
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
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readObjectList<DictationCharacter>(
        offset,
        DictationCharacterSchema.deserialize,
        allOffsets,
        DictationCharacter(),
      )) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DictationWordQueryFilter
    on QueryBuilder<DictationWord, DictationWord, QFilterCondition> {
  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      accuracyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      accuracyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      accuracyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      accuracyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accuracy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

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
      firstUnsolvedIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstUnsolvedIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      firstUnsolvedIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstUnsolvedIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      firstUnsolvedIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstUnsolvedIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      firstUnsolvedIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstUnsolvedIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      indexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'index',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      indexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'index',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      indexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      indexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      indexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      indexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'index',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
      parentIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentIndex',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      parentIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentIndex',
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      parentIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      parentIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      parentIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationWord, DictationWord, QAfterFilterCondition>
      parentIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
    r'accuracy': PropertySchema(
      id: 0,
      name: r'accuracy',
      type: IsarType.double,
    ),
    r'attempts': PropertySchema(
      id: 1,
      name: r'attempts',
      type: IsarType.long,
    ),
    r'character': PropertySchema(
      id: 2,
      name: r'character',
      type: IsarType.string,
    ),
    r'index': PropertySchema(
      id: 3,
      name: r'index',
      type: IsarType.long,
    ),
    r'isSolved': PropertySchema(
      id: 4,
      name: r'isSolved',
      type: IsarType.bool,
    ),
    r'parentIndex': PropertySchema(
      id: 5,
      name: r'parentIndex',
      type: IsarType.long,
    ),
    r'solveWithHintCount': PropertySchema(
      id: 6,
      name: r'solveWithHintCount',
      type: IsarType.long,
    ),
    r'solvedCount': PropertySchema(
      id: 7,
      name: r'solvedCount',
      type: IsarType.long,
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
  writer.writeDouble(offsets[0], object.accuracy);
  writer.writeLong(offsets[1], object.attempts);
  writer.writeString(offsets[2], object.character);
  writer.writeLong(offsets[3], object.index);
  writer.writeBool(offsets[4], object.isSolved);
  writer.writeLong(offsets[5], object.parentIndex);
  writer.writeLong(offsets[6], object.solveWithHintCount);
  writer.writeLong(offsets[7], object.solvedCount);
}

DictationCharacter _dictationCharacterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DictationCharacter(
    attempts: reader.readLongOrNull(offsets[1]) ?? 0,
    character: reader.readStringOrNull(offsets[2]),
    index: reader.readLongOrNull(offsets[3]),
    isSolved: reader.readBoolOrNull(offsets[4]) ?? false,
    parentIndex: reader.readLongOrNull(offsets[5]),
    solveWithHintCount: reader.readLongOrNull(offsets[6]) ?? 0,
    solvedCount: reader.readLongOrNull(offsets[7]) ?? 0,
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
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 7:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DictationCharacterQueryFilter
    on QueryBuilder<DictationCharacter, DictationCharacter, QFilterCondition> {
  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      accuracyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      accuracyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      accuracyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      accuracyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accuracy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      attemptsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attempts',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      attemptsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attempts',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      attemptsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attempts',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      attemptsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attempts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

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
      indexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'index',
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      indexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'index',
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      indexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      indexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      indexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      indexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'index',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      parentIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentIndex',
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      parentIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentIndex',
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      parentIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      parentIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      parentIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      parentIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      solveWithHintCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'solveWithHintCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      solveWithHintCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'solveWithHintCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      solveWithHintCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'solveWithHintCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      solveWithHintCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'solveWithHintCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      solvedCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'solvedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      solvedCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'solvedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      solvedCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'solvedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DictationCharacter, DictationCharacter, QAfterFilterCondition>
      solvedCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'solvedCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DictationCharacterQueryObject
    on QueryBuilder<DictationCharacter, DictationCharacter, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DictationSection _$DictationSectionFromJson(Map<String, dynamic> json) =>
    DictationSection(
      paragraphs: (json['paragraphs'] as List<dynamic>?)
          ?.map((e) => DictationParagraph.fromJson(e as Map<String, dynamic>))
          .toList(),
      index: (json['index'] as num?)?.toInt(),
      parentIndex: (json['parentIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DictationSectionToJson(DictationSection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'paragraphs', instance.paragraphs?.map((e) => e.toJson()).toList());
  writeNotNull('index', instance.index);
  writeNotNull('parentIndex', instance.parentIndex);
  return val;
}

DictationParagraph _$DictationParagraphFromJson(Map<String, dynamic> json) =>
    DictationParagraph(
      index: (json['index'] as num?)?.toInt(),
      parentIndex: (json['parentIndex'] as num?)?.toInt(),
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

  writeNotNull('index', instance.index);
  writeNotNull('parentIndex', instance.parentIndex);
  writeNotNull(
      'sentences', instance.sentences?.map((e) => e.toJson()).toList());
  writeNotNull('start', instance.start);
  writeNotNull('end', instance.end);
  return val;
}

DictationSentence _$DictationSentenceFromJson(Map<String, dynamic> json) =>
    DictationSentence(
      index: (json['index'] as num?)?.toInt(),
      parentIndex: (json['parentIndex'] as num?)?.toInt(),
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

  writeNotNull('index', instance.index);
  writeNotNull('parentIndex', instance.parentIndex);
  writeNotNull('sentence', instance.sentence);
  writeNotNull('words', instance.words?.map((e) => e.toJson()).toList());
  writeNotNull('start', instance.start);
  writeNotNull('end', instance.end);
  return val;
}

DictationWord _$DictationWordFromJson(Map<String, dynamic> json) =>
    DictationWord(
      index: (json['index'] as num?)?.toInt(),
      parentIndex: (json['parentIndex'] as num?)?.toInt(),
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

  writeNotNull('index', instance.index);
  writeNotNull('parentIndex', instance.parentIndex);
  writeNotNull('word', instance.word);
  writeNotNull(
      'characters', instance.characters?.map((e) => e.toJson()).toList());
  writeNotNull('start', instance.start);
  writeNotNull('end', instance.end);
  return val;
}

DictationCharacter _$DictationCharacterFromJson(Map<String, dynamic> json) =>
    DictationCharacter(
      index: (json['index'] as num?)?.toInt(),
      parentIndex: (json['parentIndex'] as num?)?.toInt(),
      character: json['character'] as String?,
      isSolved: json['isSolved'] as bool? ?? false,
      attempts: (json['attempts'] as num?)?.toInt() ?? 0,
      solvedCount: (json['solvedCount'] as num?)?.toInt() ?? 0,
      solveWithHintCount: (json['solveWithHintCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DictationCharacterToJson(DictationCharacter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('index', instance.index);
  writeNotNull('parentIndex', instance.parentIndex);
  writeNotNull('character', instance.character);
  val['isSolved'] = instance.isSolved;
  val['attempts'] = instance.attempts;
  val['solvedCount'] = instance.solvedCount;
  val['solveWithHintCount'] = instance.solveWithHintCount;
  return val;
}
