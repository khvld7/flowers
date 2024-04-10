import 'package:hive/hive.dart';
part 'hive_adapter.g.dart';

@HiveType(typeId: 0)
class DataBase extends HiveObject {
  @HiveField(0)
  int? categoryId;
  @HiveField(1)
  int? type;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String? name;
  @HiveField(4)
  int? price;
  @HiveField(5)
  String? about;
  @HiveField(6)
  bool isBought;
  @HiveField(7)
  int? count;
  @HiveField(8)
  int? id;

  DataBase({
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
