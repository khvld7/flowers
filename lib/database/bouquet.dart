class Bouquet {
  int? id;
  int? categoryId;
  int? type;
  String? image;
  String? name;
  int? price;
  String? about;
  bool isBought;
  int? count;

  Bouquet({
    this.id = 0,
    this.about = '',
    this.isBought = false,
    this.count = 0,
    this.type = 0,
    this.categoryId = 0,
    this.image = '',
    this.name = '',
    this.price = 0,
  });
}
