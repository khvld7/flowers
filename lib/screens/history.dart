import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskflower/adapter/hive_adapter.dart';
import 'package:taskflower/database/database.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskflower/globals.dart';
import '../components/custom_button.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'История заказов',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF-Pro-Display'),
                ),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Color.fromRGBO(137, 106, 219, 1),
        toolbarHeight: 100,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                color: Color.fromRGBO(137, 106, 219, 1),
                height: 36,
                onPressed: () => Navigator.popAndPushNamed(context, '/screens'),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Text(
                      'Перейти в каталог',
                    )),
              ),
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: historyBox.listenable(),
        builder:
            (BuildContext context, Box<HistoryDB> historyBox, Widget? child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: historyBox.length != 0
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 10, bottom: 50),
                    itemCount: historyBox.length,
                    itemBuilder: (context, index) {
                      final historyGet = historyBox.getAt(index);
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  color: Color.fromRGBO(159, 159, 161, 0.2))
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Text(
                                              historyGet!.bouquetName!,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'SF-Pro-Display'),
                                            )),
                                            Text(
                                              toMoney(historyGet.total!) +
                                                  ' руб.',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'SF-Pro-Display'),
                                            ),
                                          ],
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: CustomButton(
                                        width: 24,
                                        height: 24,
                                        onPressed: () => showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  alignment: Alignment.center,
                                                  backgroundColor: Colors.white,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 5,
                                                          vertical: 10),
                                                  actions: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        CustomButton(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          height: 35,
                                                          textColor:
                                                              Colors.black,
                                                          border: Border.all(
                                                            color:
                                                                Color.fromRGBO(
                                                                    137,
                                                                    106,
                                                                    219,
                                                                    1),
                                                          ),
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                          child: Text(
                                                            'Закрыть',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'SF-Pro-Display',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                        CustomButton(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          height: 35,
                                                          color: Color.fromRGBO(
                                                              137, 106, 219, 1),
                                                          onPressed: () {
                                                            historyBox.add(
                                                              HistoryDB(
                                                                  total:
                                                                      historyGet
                                                                          .total,
                                                                  bouquetName:
                                                                      historyGet
                                                                          .bouquetName),
                                                            );
                                                            updateDB();
                                                            Navigator
                                                                .popAndPushNamed(
                                                                    context,
                                                                    '/confirm');
                                                          },
                                                          child: Text(
                                                            'К оформлению',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'SF-Pro-Display',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                  title: Center(
                                                    child: Text(
                                                      'Повторение заказа',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              'SF-Pro-Display'),
                                                    ),
                                                  ),
                                                  content: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                    child: Text(
                                                      'Вы действительно хотите повторить заказ?',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily:
                                                              'SF-Pro-Display'),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                        child: SvgPicture.asset(
                                            'assets/icons/refresh_icon.svg')),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                : Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/system_image/history_flowers.png',
                          fit: BoxFit.contain,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        Text(
                          'Вы еще не делали заказов',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(123, 123, 123, 1)),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
