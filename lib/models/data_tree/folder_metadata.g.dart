// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderMetadata _$FolderMetadataFromJson(Map<String, dynamic> json) =>
    FolderMetadata(
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FolderMetadataToJson(FolderMetadata instance) =>
    <String, dynamic>{
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
    };
