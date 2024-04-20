import 'package:flutter/material.dart';
import 'package:taskflower/adapter/hive_adapter.dart';
import 'package:taskflower/components/card.dart';
import 'package:taskflower/components/custom_button.dart';
import 'package:taskflower/database/bouquet.dart';
import 'package:taskflower/database/database.dart';
import 'package:taskflower/globals.dart';

class CatalogScreen extends StatefulWidget {
  CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => CatalogScreenState();
}

class CatalogScreenState extends State<CatalogScreen> {
  Map<int, Bouquet> flowersData = {};

  updateIsBought({required int id}) {
    if (flowersData[id] != null)
      setState(() {
        box.putAt(
          id,
          DataBase(
            id: flowersData[id]!.id,
            type: flowersData[id]!.type,
            categoryId: flowersData[id]!.categoryId,
            image: flowersData[id]!.image,
            name: flowersData[id]!.name,
            price: flowersData[id]!.price,
            about: flowersData[id]!.about,
            isBought: !flowersData[id]!.isBought,
            count: flowersData[id]!.count,
          ),
        );
      });
    initFlowersDB();
  }

  initFlowersDB() {
    setState(() {
      flowersData[0] = Bouquet(
          id: box.getAt(0)?.id,
          type: box.getAt(0)?.type,
          categoryId: box.getAt(0)?.categoryId,
          image: box.getAt(0)?.image,
          name: box.getAt(0)?.name,
          isBought: box.getAt(0)?.isBought ?? false,
          about: box.getAt(0)?.about,
          price: box.getAt(0)?.price);

      flowersData[1] = Bouquet(
          id: box.getAt(1)?.id,
          type: box.getAt(1)?.type,
          categoryId: box.getAt(1)?.categoryId,
          image: box.getAt(1)?.image,
          name: box.getAt(1)?.name,
          isBought: box.getAt(1)?.isBought ?? false,
          about: box.getAt(1)?.about,
          price: box.getAt(1)?.price);

      flowersData[12] = Bouquet(
          id: box.getAt(12)?.id,
          type: box.getAt(12)?.type,
          categoryId: box.getAt(12)?.categoryId,
          image: box.getAt(12)?.image,
          name: box.getAt(12)?.name,
          isBought: box.getAt(12)?.isBought ?? false,
          about: box.getAt(12)?.about,
          price: box.getAt(12)?.price);

      flowersData[13] = Bouquet(
          id: box.getAt(13)?.id,
          type: box.getAt(13)?.type,
          categoryId: box.getAt(13)?.categoryId,
          image: box.getAt(13)?.image,
          name: box.getAt(13)?.name,
          isBought: box.getAt(13)?.isBought ?? false,
          about: box.getAt(13)?.about,
          price: box.getAt(13)?.price);
    });
  }

  @override
  void initState() {
    initFlowersDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initFlowersDB();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                'Каталог',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF-Pro-Display'),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Color.fromRGBO(137, 106, 219, 1),
        toolbarHeight: 100,
      ),
      body: flowersData.isNotEmpty
          ? ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 10, bottom: 20),
              children: [
                Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 36, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Цветы в горшках',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'SF-Pro-Display'),
                          ),
                          RawMaterialButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/flowerall')
                                  .then((value) => setState(() {}));
                              ;
                            },
                            child: Text(
                              'Смотреть все',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(137, 106, 219, 1),
                                  decorationColor:
                                      Color.fromRGBO(137, 106, 219, 1),
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardWidget(
                          flowerData: flowersData[0],
                          addBasket: () => updateIsBought(id: 0),
                          onTapCard: () => showCardDialog(
                              context: context,
                              flowerData: flowersData[0],
                              addBasket: () {
                                setState(() {
                                  flowersData[0]?.isBought ?? true;
                                  updateIsBought(id: 0);
                                });
                                Navigator.pop(context);
                              }),
                        ),
                        CardWidget(
                          flowerData: flowersData[1],
                          addBasket: () => updateIsBought(id: 1),
                          onTapCard: () => showCardDialog(
                              context: context,
                              flowerData: flowersData[1],
                              addBasket: () {
                                setState(() {
                                  flowersData[1]?.isBought ?? true;
                                  updateIsBought(id: 1);
                                });
                                Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 36, vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Готовые букеты',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SF-Pro-Display'),
                                ),
                              ),
                              RawMaterialButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/finishedall')
                                      .then((value) => setState(() {}));
                                  ;
                                },
                                child: Text(
                                  'Смотреть все',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromRGBO(137, 106, 219, 1),
                                      decorationColor:
                                          Color.fromRGBO(137, 106, 219, 1),
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardWidget(
                          flowerData: flowersData[12],
                          addBasket: () => updateIsBought(id: 12),
                          onTapCard: () => showCardDialog(
                              context: context,
                              flowerData: flowersData[12],
                              addBasket: () {
                                setState(() {
                                  flowersData[12]?.isBought ?? true;
                                  updateIsBought(id: 12);
                                });
                                Navigator.pop(context);
                              }),
                        ),
                        CardWidget(
                          flowerData: flowersData[13],
                          addBasket: () => updateIsBought(id: 13),
                          onTapCard: () => showCardDialog(
                              context: context,
                              flowerData: flowersData[13],
                              addBasket: () {
                                setState(() {
                                  flowersData[13]?.isBought ?? true;
                                  updateIsBought(id: 13);
                                });
                                Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          : SizedBox.shrink(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                color: Color.fromRGBO(137, 106, 219, 1),
                height: 36,
                onPressed: () {
                  Navigator.of(context).pushNamed('/constructor');
                },
                child: Text(
                  'Собрать букет самому',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
