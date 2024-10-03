import 'package:tree_data_model/tree_data_model.dart';

extension NodeEx on Node{
  String? parentId({required String childId}){
    return _parentId(root: this, childId: childId);
  }

  String? _parentId({required Node root,required String childId}){
    for(final node in nodes()){
      if(node.subTrees.where((t){
        if(t is Node){
          return t.id==childId;
        }else if(t is Leaf){
          return t.id==childId;
        }else{
          return false;
        }
      }).isNotEmpty){
        return node.id;
      }
    }
    return null;
    // if (root.subTrees.where((t) {
    //   if (t is Node) {
    //     return t.id == childId;
    //   } else if (t is Leaf) {
    //     return t.id == childId;
    //   } else {
    //     return false;
    //   }
    // }).isNotEmpty) {
    //   return root.id;
    // } else {
    //   for (final node in root.subTrees.whereType<Node>()) {
    //     final id = _parentId(root: node, childId: childId);
    //     if (id != null) return id;
    //   }
    // }
  }
}

extension LeafEx<T,U> on Leaf<T,U>{
    Leaf<T,U> copyWith({
    T? value,
  }) {
    return Leaf<T,U>(
      id: id, 
      value: value ?? this.value,
    );
  }
}

extension ListEx<T> on List<T>{
  List<T> replace(int index,T newValue){
    if(index<0 || length-1<index) return this;
    return [
      ...sublist(0,index),
      newValue,
      ...sublist(index+1)
    ];
  }
}