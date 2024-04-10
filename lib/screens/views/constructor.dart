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

class _ConstructorState extends State<Constructor> {
  Map<int, Bouquet> flowersData = {};

  updateCount({required int id}) {
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
                about: flower.about,
                price: flower.price,
                count: flower.count,
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
        if (flower.type == 1 && flower.count! > 0)
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
              count: 0,
            ),
          );
      },
    );
    initFlowersDB();
    super.initState();
  }

  final int packetPrice = 300;
  int total = 0;
  bool checkBox = false;

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
                total = 0;
                flowersData.forEach(
                  (key, value) {
                    if (value.count! > 0) {
                      final result = value.count! * value.price!;
                      total += result;
                    }
                  },
                );
                showModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      StatefulBuilder(builder: (context, state) {
                    return Container(
                      padding: EdgeInsets.all(24),
                      color: Colors.white,
                      height: 168,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10, right: 10, bottom: 10),
                                width: 24,
                                height: 24,
                                child: RawMaterialButton(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onPressed: () {
                                      state(() {
                                        checkBox = !checkBox;
                                        checkBox
                                            ? total += packetPrice
                                            : total -= packetPrice;
                                      });
                                    },
                                    child: checkBox == false
                                        ? SvgPicture.asset(
                                            'assets/icons/check_box.svg')
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
                                          text: ')',
                                          style: TextStyle(color: Colors.black))
                                    ]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 36,
                                width: 36,
                                child: CustomButton(
                                  onPressed: () {},
                                  child: SvgPicture.asset(
                                      'assets/icons/save_big.svg'),
                                ),
                              ),
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                    Navigator.popAndPushNamed(
                                        context, '/confirm');
                                  },
                                  child: Text('Перейти к оформлению'),
                                  color: Color.fromRGBO(137, 106, 219, 1),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
                );
              },
              child: SvgPicture.asset('assets/icons/save_bouquet.svg'),
            )
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Color.fromRGBO(137, 106, 219, 1),
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.builder(
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
                  updateCount(id: flower.id ?? 0);
                });
              },
              onMinus: () {
                if (flower.count! > 0)
                  setState(() {
                    flower.count = flower.count! - 1;
                    updateCount(id: flower.id ?? 0);
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
