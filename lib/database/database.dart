import 'package:hive_flutter/adapters.dart';
import 'package:taskflower/adapter/hive_adapter.dart';
import 'package:taskflower/client/hive_names.dart';
import 'package:taskflower/database/bouquet.dart';

var box = Hive.box<DataBase>(HiveBoxes.dataBase);
final flowers = [
  //Цветы в горшках
  Bouquet(
      id: 0,
      categoryId: 0,
      type: 0,
      image: 'assets/images/flowers/chrizantema.png',
      name: 'Хризантема',
      price: 1900,
      about:
          'Относится к роду травянистых растений семейства Астровые или Сложноцветные, включающему в себя 42 вида растений.'),
  Bouquet(
      id: 1,
      categoryId: 1,
      type: 0,
      image: 'assets/images/flowers/endorphimina.png',
      name: 'Эндорфимина',
      price: 3150,
      about: 'Какой-то нереальный цветок в горшке'),
  Bouquet(
      id: 2,
      categoryId: 2,
      type: 0,
      image: 'assets/images/flowers/fialka.png',
      name: 'Фиалка',
      price: 900,
      about:
          'Фиалка – очень многогранный и символичный цветок – эмблема зарождающейся весенней природы и одновременно – растение печали и скорби'),
  Bouquet(
      id: 3,
      categoryId: 3,
      type: 0,
      image: 'assets/images/flowers/john_doe.png',
      name: 'John Doe',
      price: 5650,
      about: 'Воображаемый истец. Некий мафиози'),
  Bouquet(
      id: 4,
      categoryId: 4,
      type: 0,
      image: 'assets/images/flowers/monstera.png',
      name: 'Монстера',
      price: 2000,
      about:
          'Вечнозелёные лианы и кустарники, у которых толстые побеги являются лазящими, а также зачастую присутствуют воздушные корни.'),
  Bouquet(
      id: 5,
      categoryId: 5,
      type: 0,
      image: 'assets/images/flowers/paporotnik.png',
      name: 'Папоротник Домашний',
      price: 2470,
      about:
          'Папоротник способен расти не только в лесных массивах, но и в цветочном горшке. Если учесть особенности природной среды, цветок отлично приживётся дома.'),

// Конструктор букетов
  Bouquet(
      id: 6,
      categoryId: 0,
      type: 1,
      image: 'assets/images/constructor_flowers/iris.png',
      name: 'Ирис',
      price: 260),
  Bouquet(
      id: 7,
      categoryId: 1,
      type: 1,
      image: 'assets/images/constructor_flowers/orchideya_big.png',
      name: 'Орхидея',
      price: 550),
  Bouquet(
      id: 8,
      categoryId: 2,
      type: 1,
      image: 'assets/images/constructor_flowers/orchideya.png',
      name: 'Орхидея',
      price: 400),
  Bouquet(
      id: 9,
      categoryId: 3,
      type: 1,
      image: 'assets/images/constructor_flowers/pion.png',
      name: 'Пион',
      price: 500),
  Bouquet(
      id: 10,
      categoryId: 4,
      type: 1,
      image: 'assets/images/constructor_flowers/rose.png',
      name: 'Роза',
      price: 400),
  Bouquet(
      id: 11,
      categoryId: 5,
      type: 1,
      image: 'assets/images/constructor_flowers/tulpan.png',
      name: 'Тюльпан',
      price: 50),

  // Букеты
  Bouquet(
      id: 12,
      categoryId: 0,
      type: 2,
      image: 'assets/images/bouquet/birthday.png',
      name: 'Букет на День Рождения',
      price: 1850,
      about:
          'Отличное сочетание разновидности цветов, что придает яркое представление о жизни'),
  Bouquet(
      id: 13,
      categoryId: 1,
      type: 2,
      image: 'assets/images/bouquet/married.png',
      name: 'Букет Свадебный',
      price: 3500,
      about:
          'Свадебный букет отличается от обычного тем, что его элементы компонуются всегда намного плотнее друг к другу.'),
  Bouquet(
      id: 14,
      categoryId: 2,
      type: 2,
      image: 'assets/images/bouquet/romantic.png',
      name: 'Букет "Романтика"',
      price: 3850,
      about:
          'Нежную любовь символизируют примулы, цветы лотоса, белые фиалки и жасмины. Очарованность выражают ландышами, белыми лилиями и лавандой.'),
  Bouquet(
      id: 15,
      categoryId: 3,
      type: 2,
      image: 'assets/images/bouquet/rose_bouquet.png',
      name: 'Розы, 15 шт.',
      price: 2250,
      about:
          'Ро́за — собирательное название видов и сортов представителей рода Шипо́вник, выращиваемых человеком и растущих в дикой природе.'),
  Bouquet(
      id: 16,
      categoryId: 4,
      type: 2,
      image: 'assets/images/bouquet/tulpan_bouquet.png',
      name: 'Тюльпы 7 шт.',
      price: 800,
      about:
          'Тюльпа́н — род многолетних травянистых луковичных растений семейства Лилейные, в современных систематиках включающий более 80 видов.'),
  Bouquet(
      id: 17,
      categoryId: 5,
      type: 2,
      image: 'assets/images/bouquet/autumn.png',
      name: 'Букет "Осенний"',
      price: 3000,
      about:
          'Отличительной особенностью осеннего букета является наличие в нем не только срезанных цветов, но и ягод, веток, трав, колосьев и другого материала.'),
];

void addFlowers() {
  for (var i = 0; i < flowers.length; i++) {
    box.add(
      DataBase(
        id: flowers[i].id,
        type: flowers[i].type,
        categoryId: flowers[i].categoryId,
        image: flowers[i].image,
        name: flowers[i].name,
        price: flowers[i].price,
        about: flowers[i].about,
        isBought: flowers[i].isBought,
        count: flowers[i].count,
      ),
    );
  }
}
