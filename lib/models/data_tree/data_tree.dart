import 'package:dict_app/models/data_tree/dict_data/dict_data.dart';
import 'package:dict_app/models/data_tree/folder_metadata.dart';
import 'package:tree_data_model/tree_data_model.dart';

typedef DataTree = Tree<DictData,FolderMetadata>;
typedef Dict = Leaf<DictData,FolderMetadata>;
typedef Folder = Node<DictData,FolderMetadata>;