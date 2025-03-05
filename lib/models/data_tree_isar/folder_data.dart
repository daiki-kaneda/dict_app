import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'folder_data.g.dart';

@collection
@JsonSerializable()
class FolderData {
  FolderData({required this.title, required this.createdAt}); 

  Id id = Isar.autoIncrement;

  final String title; 
  final DateTime createdAt; 

  factory FolderData.fromJson(Map<String, dynamic> json) =>
      _$FolderDataFromJson(json);

  Map<String, dynamic> toJson() => _$FolderDataToJson(this);
}
