extension ListEx<T> on List<T>{
  List<T> replace(int index,T newValue){
    if(index<0 || length-1<index) return this;
    return [
      ...sublist(0,index),
      newValue,
      ...sublist(index+1)
    ];
  }

  List<List<T>> splitBySize(int n){
    final q = length ~/ n;
    return [
      for(int i=0;i<q;i++)
      sublist(i*n,(i+1)*n),
      sublist(n*q)
    ];
  }
}
