class Lookup {
  int id;
  String description;
  String code;
  @override
  bool operator ==(dynamic other) =>
      other != null && other is Lookup && id == other.id;

  @override
  int get hashCode => super.hashCode;
  @override
  String toString(){
    return "$code - $description";
  }
  Lookup({required this.id,required this.description,required this.code});
}