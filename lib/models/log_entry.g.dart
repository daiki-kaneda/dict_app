// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_entry.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLogEntryCollection on Isar {
  IsarCollection<LogEntry> get logEntrys => this.collection();
}

const LogEntrySchema = CollectionSchema(
  name: r'LogEntry',
  id: -8268688274231935295,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'fileId': PropertySchema(
      id: 1,
      name: r'fileId',
      type: IsarType.long,
    ),
    r'result': PropertySchema(
      id: 2,
      name: r'result',
      type: IsarType.object,
      target: r'AnswerResult',
    )
  },
  estimateSize: _logEntryEstimateSize,
  serialize: _logEntrySerialize,
  deserialize: _logEntryDeserialize,
  deserializeProp: _logEntryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'AnswerResult': AnswerResultSchema},
  getId: _logEntryGetId,
  getLinks: _logEntryGetLinks,
  attach: _logEntryAttach,
  version: '3.1.0+1',
);

int _logEntryEstimateSize(
  LogEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      AnswerResultSchema.estimateSize(
          object.result, allOffsets[AnswerResult]!, allOffsets);
  return bytesCount;
}

void _logEntrySerialize(
  LogEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeLong(offsets[1], object.fileId);
  writer.writeObject<AnswerResult>(
    offsets[2],
    allOffsets,
    AnswerResultSchema.serialize,
    object.result,
  );
}

LogEntry _logEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LogEntry(
    date: reader.readDateTime(offsets[0]),
    fileId: reader.readLong(offsets[1]),
    result: reader.readObjectOrNull<AnswerResult>(
          offsets[2],
          AnswerResultSchema.deserialize,
          allOffsets,
        ) ??
        AnswerResult(),
  );
  object.id = id;
  return object;
}

P _logEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<AnswerResult>(
            offset,
            AnswerResultSchema.deserialize,
            allOffsets,
          ) ??
          AnswerResult()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _logEntryGetId(LogEntry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _logEntryGetLinks(LogEntry object) {
  return [];
}

void _logEntryAttach(IsarCollection<dynamic> col, Id id, LogEntry object) {
  object.id = id;
}

extension LogEntryQueryWhereSort on QueryBuilder<LogEntry, LogEntry, QWhere> {
  QueryBuilder<LogEntry, LogEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LogEntryQueryWhere on QueryBuilder<LogEntry, LogEntry, QWhereClause> {
  QueryBuilder<LogEntry, LogEntry, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LogEntryQueryFilter
    on QueryBuilder<LogEntry, LogEntry, QFilterCondition> {
  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> fileIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileId',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> fileIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileId',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> fileIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileId',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> fileIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LogEntryQueryObject
    on QueryBuilder<LogEntry, LogEntry, QFilterCondition> {
  QueryBuilder<LogEntry, LogEntry, QAfterFilterCondition> result(
      FilterQuery<AnswerResult> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'result');
    });
  }
}

extension LogEntryQueryLinks
    on QueryBuilder<LogEntry, LogEntry, QFilterCondition> {}

extension LogEntryQuerySortBy on QueryBuilder<LogEntry, LogEntry, QSortBy> {
  QueryBuilder<LogEntry, LogEntry, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterSortBy> sortByFileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileId', Sort.asc);
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterSortBy> sortByFileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileId', Sort.desc);
    });
  }
}

extension LogEntryQuerySortThenBy
    on QueryBuilder<LogEntry, LogEntry, QSortThenBy> {
  QueryBuilder<LogEntry, LogEntry, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterSortBy> thenByFileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileId', Sort.asc);
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterSortBy> thenByFileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileId', Sort.desc);
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LogEntry, LogEntry, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension LogEntryQueryWhereDistinct
    on QueryBuilder<LogEntry, LogEntry, QDistinct> {
  QueryBuilder<LogEntry, LogEntry, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<LogEntry, LogEntry, QDistinct> distinctByFileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileId');
    });
  }
}

extension LogEntryQueryProperty
    on QueryBuilder<LogEntry, LogEntry, QQueryProperty> {
  QueryBuilder<LogEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LogEntry, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<LogEntry, int, QQueryOperations> fileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileId');
    });
  }

  QueryBuilder<LogEntry, AnswerResult, QQueryOperations> resultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'result');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogEntry _$LogEntryFromJson(Map<String, dynamic> json) => LogEntry(
      date: DateTime.parse(json['date'] as String),
      fileId: (json['fileId'] as num).toInt(),
      result: AnswerResult.fromJson(json['result'] as Map<String, dynamic>),
    )..id = (json['id'] as num).toInt();

Map<String, dynamic> _$LogEntryToJson(LogEntry instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'fileId': instance.fileId,
      'result': instance.result.toJson(),
    };
