import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/models/data_tree/dict_data/dict_data.dart';
import 'package:dict_app/models/data_tree/dict_data/dict_data_model/dictation_data_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scripts_provider.g.dart';

@Riverpod(keepAlive: true)
class ScriptsNotifier extends _$ScriptsNotifier {
  @override
  Future<List<String>> build() async {
    return [];
  }

  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> get scriptsRef =>
      firestore.collection('scripts');

  // Future<void> addDict(DictData dictToShare) async {
  //   scriptsRef.doc().set(dictToShare.toJson());
  // }

  void refresh() {
    ref.invalidateSelf();
  }
}
