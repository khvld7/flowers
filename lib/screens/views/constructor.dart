import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskflower/adapter/hive_adapter.dart';
import 'package:taskflower/components/card_constructor.dart';
import 'package:taskflower/components/custom_button.dart';
import 'package:taskflower/database/bouquet.dart';
import 'package:taskflower/database/database.dart';
import 'package:taskflower/globals.dart';

class Constructor extends StatefulWidget {
  const Constructor({super.key});

  @override
  State<Constructor> createState() => _ConstructorState();
}

int total = 0;
int packetPrice = 300;
bool checkPacket = false;

class _ConstructorState extends State<Constructor> {
  List<Bouquet> history = [];
  List<Bouquet> save = [];
  Map<int, Bouquet> flowersData = {};
  addSave({required int index}) {
    setState(
      () {
        save.add(
          Bouquet(
            id: flowersData[index]!.id,
            type: flowersData[index]!.type,
            categoryId: flowersData[index]!.categoryId,
            image: flowersData[index]!.image,
            name: flowersData[index]!.name,
            price: flowersData[index]!.price,
            about: flowersData[index]!.about,
            isBought: flowersData[index]!.isBought,
            isSaved: flowersData[index]!.isSaved,
            count: flowersData[index]!.count,
            total: flowersData[index]!.total,
          ),
        );
      },
    );
  }

  joinList() {
    String name = '';
    int price = 0;
    int count = 0;
    int total = 0;

    setState(() {
      checkPacket ? total += packetPrice : total;
      save.forEach(
        (element) {
          name += '${element.name} ';
          if (element.count! > 1) {
            final bouquetTotal = element.price! * element.count!;
            price += bouquetTotal;
          } else {
            price += element.price!;
          }
        },
      );
      price += total;
      saveBox.add(
        SaveDB(
          saveDB: DataBase(
            name: name,
            count: count,
            total: price,
          ),
        ),
      );
    });
  }

  addHistoryDB({required int index}) {
    setState(() {
      if (flowersData[index]!.count != 0) {
        history.add(Bouquet(
          id: flowersData[index]!.id,
          type: flowersData[index]!.type,
          categoryId: flowersData[index]!.categoryId,
          image: flowersData[index]!.image,
          name: flowersData[index]!.name,
          isBought: flowersData[index]!.isBought,
          isSaved: flowersData[index]!.isSaved,
          about: flowersData[index]!.about,
          price: flowersData[index]!.price,
          count: flowersData[index]!.count,
          total: flowersData[index]!.total,
        ));
      }
    });
  }

  joinHistory() {
    String name = '';
    int price = 0;
    int count = 0;
    int total = 0;

    setState(() {
      checkPacket ? total += packetPrice : total;
      history.forEach(
        (element) {
          name += '${element.name} ';
          if (element.count! > 1) {
            final bouquetTotal = element.price! * element.count!;
            price += bouquetTotal;
          } else {
            price += element.price!;
          }
        },
      );

      price += total;
      historyBox.add(
        HistoryDB(
          total: price,
          bouquetName: name,
        ),
      );
      updateDB();
    });
  }

  initFlowersDB() {
    box.values.forEach(
      (flower) {
        if (flower.type == 1)
          setState(
            () {
              flowersData[flower.id ?? 0] = Bouquet(
                id: flower.id,
                type: flower.type,
                categoryId: flower.categoryId,
                image: flower.image,
                name: flower.name,
                isBought: flower.isBought,
                isSaved: flower.isSaved,
                about: flower.about,
                price: flower.price,
                count: flower.count,
                total: flower.total,
              );
            },
          );
      },
    );
  }

  @override
  void initState() {
    box.values.forEach(
      (flower) {
        if (flower.type == 1 && flower.count != 0)
          box.putAt(
            flower.id!,
            DataBase(
              id: flower.id,
              type: flower.type,
              categoryId: flower.categoryId,
              image: flower.image,
              name: flower.name,
              price: flower.price,
              about: flower.about,
              isBought: flower.isBought,
              isSaved: flower.isSaved,
              count: flower.count,
              total: flower.total,
            ),
          );
      },
    );
    initFlowersDB();
    super.initState();
  }

  bool checkSaved = false;

  @override
  Widget build(BuildContext context) {
    total = 0;
    checkPacket ? total += packetPrice : total;
    flowersData.forEach(
      (index, value) {
        if (value.count != 0 && value.type == 1) {
          value.total = value.price! * value.count!;
          final result = value.total!;
          total += result;
        }
      },
    );

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Конструктор букета',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF-Pro-Display'),
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, '/saved_bouquet')
                    .then((value) => setState(() {}));
                ;
              },
              child: SvgPicture.asset('assets/icons/save_bouquet.svg'),
            )
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Color.fromRGBO(137, 106, 219, 1),
        toolbarHeight: 100,
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(24),
        color: Colors.white,
        height: 210,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Общая сумма: ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SF-Pro-Display'),
                    ),
                  ),
                  Text(
                    toMoney(total),
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 10, bottom: 10),
                    width: 24,
                    height: 24,
                    child: RawMaterialButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            total != 0 ? checkPacket = !checkPacket : 0;
                          });
                        },
                        child: checkPacket == false
                            ? SvgPicture.asset('assets/icons/check_box.svg')
                            : SvgPicture.asset(
                                'assets/icons/active_icon/check_box_active.svg')),
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'Добавить упаковку (',
                              style: TextStyle(
                                color: Colors.black,
                              )),
                          TextSpan(
                            text: '$packetPrice' + ' руб.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text: ')', style: TextStyle(color: Colors.black))
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 36,
                    width: 36,
                    child: CustomButton(
                      onPressed: () {
                        setState(() {
                          total == 0 ? checkSaved : checkSaved = true;
                          save.clear();
                          flowersData.values.forEach(
                            (element) {
                              if (element.count != 0) {
                                addSave(index: element.id!);
                              }
                            },
                          );
                          joinList();
                        });
                      },
                      child: checkSaved
                          ? SvgPicture.asset(
                              'assets/icons/active_icon/save_big_active.svg')
                          : SvgPicture.asset('assets/icons/save_big.svg'),
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        total != 0
                            ? {
                                setState(
                                  () {
                                    history.clear();
                                    flowersData.values.forEach(
                                      (element) {
                                        if (element.count != 0) {
                                          addHistoryDB(index: element.id!);
                                        }
                                      },
                                    );
                                    joinHistory();
                                  },
                                ),
                                Navigator.pushNamed(context, '/confirm'),
                              }
                            : () {};
                      },
                      child: Text('Перейти к оформлению'),
                      color: total != 0
                          ? Color.fromRGBO(137, 106, 219, 1)
                          : Color.fromRGBO(212, 212, 212, 1),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: 10, bottom: 210),
          itemCount: flowersData.length,
          itemBuilder: (BuildContext context, int index) {
            final flower = flowersData.values.elementAt(index);
            return CardConstructor(
              image: flower.image ?? '',
              name: flower.name ?? '',
              price: flower.price ?? 0,
              count: flower.count ?? 0,
              onPlus: () {
                setState(() {
                  flower.count = flower.count! + 1;
                  checkSaved = false;
                });
              },
              onMinus: () {
                if (flower.count! > 0)
                  setState(() {
                    flower.count = flower.count! - 1;
                    checkSaved = false;
                  });
              },
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 220,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
