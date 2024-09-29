import 'package:json_annotation/json_annotation.dart';

part 'folder_metadata.g.dart';

@JsonSerializable()
class FolderMetadata {
  final String title;
  
  final DateTime createdAt;

  FolderMetadata({
    required this.title,
    required this.createdAt
  });

  FolderMetadata copyWith({
    String? title,
    DateTime? createdAt,
  }) {
    return FolderMetadata(
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory FolderMetadata.fromJson(Map<String, dynamic> json) => _$FolderMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$FolderMetadataToJson(this);
}