import 'package:dict_app/my_dict/providers/local_database_provider/local_database_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_database_provider.g.dart';

@riverpod
FutureOr<LocalDatabaseHelper> localDatabase(LocalDatabaseRef ref) async{
  final localDatabase = LocalDatabaseHelper();
  await localDatabase.init();
  return localDatabase;
}