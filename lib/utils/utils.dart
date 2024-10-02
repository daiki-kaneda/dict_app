bool isAlphabet(String character){
  final rxp = RegExp(r'[a-zA-Z]');
  return rxp.hasMatch(character);
}