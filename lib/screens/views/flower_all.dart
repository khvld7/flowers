import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskflower/adapter/hive_adapter.dart';
import 'package:taskflower/components/card.dart';
import 'package:taskflower/database/bouquet.dart';
import 'package:taskflower/database/database.dart';
import 'package:taskflower/globals.dart';

class FlowerAll extends StatefulWidget {
  const FlowerAll({super.key});

  @override
  State<FlowerAll> createState() => _FlowerAllState();
}

class _FlowerAllState extends State<FlowerAll> {
  List<Bouquet> flowersIn = [];

  updateIsBought({required int id}) {
    int categoryId = box.getAt(id)?.categoryId ?? 0;
    setState(() {
      flowersIn[categoryId].isBought = !flowersIn[categoryId].isBought;

      if (box.getAt(id) != null)
        box.putAt(
          id,
          DataBase(
              id: flowersIn[categoryId].id,
              type: flowersIn[categoryId].type,
              categoryId: flowersIn[categoryId].categoryId,
              image: flowersIn[categoryId].image,
              name: flowersIn[categoryId].name,
              price: flowersIn[categoryId].price,
              about: flowersIn[categoryId].about,
              isBought: flowersIn[categoryId].isBought,
              count: flowersIn[categoryId].count),
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
      if (_flower.type == 0) {
        flowersIn.add(_flower);
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
              Navigator.of(context).pop();
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
              'Цветы в горшках',
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
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: 10, bottom: 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 50,
            mainAxisExtent: 209,
          ),
          itemCount: flowersIn.length,
          itemBuilder: (BuildContext context, int index) {
            return CardWidget(
                onTapCard: () => showCardDialog(
                    context: context,
                    flowerData: flowersIn[index],
                    addBasket: () {
                      setState(() {
                        flowersIn[index].isBought = true;
                        box.values
                            .firstWhere((el) =>
                                el.type == flowersIn[index].type &&
                                el.categoryId == flowersIn[index].categoryId)
                            .isBought = flowersIn[index].isBought;
                      });
                      Navigator.pop(context);
                    }),
                flowerData: flowersIn[index],
                addBasket: () => updateIsBought(
                      id: flowersIn[index].id ?? index,
                    ));
          },
        ),
      ),
    );
  }
}
