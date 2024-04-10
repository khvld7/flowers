import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskflower/adapter/hive_adapter.dart';
import 'package:taskflower/components/card.dart';
import 'package:taskflower/database/bouquet.dart';
import 'package:taskflower/database/database.dart';

class FinishedAll extends StatefulWidget {
  const FinishedAll({super.key});

  @override
  State<FinishedAll> createState() => FinishedAllState();
}

class FinishedAllState extends State<FinishedAll> {
  List<Bouquet> finishedBouquet = [];

  updateIsBought({required int id}) {
    int categoryId = box.getAt(id)?.categoryId ?? 0;
    setState(() {
      finishedBouquet[categoryId].isBought =
          !finishedBouquet[categoryId].isBought;

      if (box.getAt(id) != null)
        box.putAt(
          id,
          DataBase(
              id: finishedBouquet[categoryId].id,
              type: finishedBouquet[categoryId].type,
              categoryId: finishedBouquet[categoryId].categoryId,
              image: finishedBouquet[categoryId].image,
              name: finishedBouquet[categoryId].name,
              price: finishedBouquet[categoryId].price,
              about: finishedBouquet[categoryId].about,
              isBought: finishedBouquet[categoryId].isBought,
              count: finishedBouquet[categoryId].count),
        );
    });
  }

  @override
  void initState() {
    for (var i = 0; i < box.length; i++) {
      final Bouquet _flower = Bouquet(
        id: box.getAt(i)?.id,
        image: box.getAt(i)?.image,
        name: box.getAt(i)?.name,
        price: box.getAt(i)?.price,
        about: box.getAt(i)?.about,
        isBought: box.getAt(i)?.isBought ?? false,
        categoryId: box.getAt(i)?.categoryId,
        type: box.getAt(i)?.type,
      );
      if (_flower.type == 2) {
        finishedBouquet.add(_flower);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          margin: EdgeInsets.only(left: 25),
          child: RawMaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/icons/back_button.svg',
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Готовые букеты',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF-Pro-Display'),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Color.fromRGBO(137, 106, 219, 1),
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 50,
            mainAxisExtent: 209,
          ),
          itemCount: finishedBouquet.length,
          itemBuilder: (BuildContext context, int index) {
            return CardWidget(
              onTapCard: () {},
              flowerData: finishedBouquet[index],
              addBasket: () =>
                  updateIsBought(id: finishedBouquet[index].id ?? index),
            );
          },
        ),
      ),
    );
  }
}
