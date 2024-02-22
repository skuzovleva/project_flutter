class CoffeeModel {
  final String name;
  final String subName;
  final String imgPath;
  final double price;
  final double rate;
  final String description;
  bool isFavourite;

  CoffeeModel(
      {required this.name,
      required this.isFavourite,
      required this.description,
      required this.imgPath,
      required this.price,
      required this.rate,
      required this.subName});
}
