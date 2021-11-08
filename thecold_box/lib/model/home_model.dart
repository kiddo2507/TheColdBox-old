class HomeModel {
  final String id;
  final String name;
  //final String useby;
  bool isUsed;

  HomeModel(
      {required this.id,
      required this.name,
      //required this.useby,
      this.isUsed = false});
}
