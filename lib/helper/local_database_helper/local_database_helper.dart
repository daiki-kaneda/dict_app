
import 'package:dict_app/helper/local_database_helper/local_data_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabaseHelper {
  late final SharedPreferences _preferences;

  Future<void> init()async{
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveData(LocalDataStatus status,String jsonString)async{
    _preferences.setString(status.key, jsonString);
  }
  
  String? loadData(LocalDataStatus status){
    return _preferences.getString(status.key);
  }
}