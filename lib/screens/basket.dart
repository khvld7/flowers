import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskflower/adapter/hive_adapter.dart';
import 'package:taskflower/components/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskflower/database/database.dart';
import 'package:taskflower/globals.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                'Корзина',
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
      body: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box<DataBase> box, _) {
            return box.values.any((el) => el.isBought == true)
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 10, bottom: 50),
                    itemCount: box.length,
                    itemBuilder: (BuildContext context, int index) {
                      final getBox = box.getAt(index);
                      if (getBox?.isBought == true) {
                        return Dismissible(
                          onDismissed: ((direction) {
                            setState(() {
                              getBox!.isBought = false;
                            });
                          }),
                          resizeDuration: Duration(milliseconds: 300),
                          direction: DismissDirection.endToStart,
                          background: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: Container(
                              decoration: ShapeDecoration(
                                color: Color.fromRGBO(255, 59, 48, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 15),
                                    child: SvgPicture.asset(
                                      'assets/icons/trash_icon.svg',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            height: 72,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(1, 1),
                                      color: Color.fromRGBO(159, 159, 161, 0.2))
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            box.getAt(index)?.name ?? '',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'SF-Pro-Display'),
                                          ),
                                        ),
                                        Text(
                                          toMoney(box.getAt(index)?.price ??
                                                  0) +
                                              ' руб.',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'SF-Pro-Display'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          key: UniqueKey(),
                        );
                      }
                      return SizedBox.shrink();
                    })
                : Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/system_image/empty_basket.png',
                          fit: BoxFit.contain,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        Text(
                          'Ваша корзина пуста',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(123, 123, 123, 1)),
                        ),
                      ],
                    ),
                  );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                color: box.values.any((el) => el.isBought == true)
                    ? Color.fromRGBO(137, 106, 219, 1)
                    : Color.fromRGBO(212, 212, 212, 1),
                height: 36,
                onPressed: () {
                  setState(() {
                    if (box.values.any((el) => el.isBought == true))
                      box.values.forEach(
                        (element) {
                          if (element.isBought == true) {
                            historyBox.add(
                              HistoryDB(
                                total: element.price,
                                bouquetName: element.name,
                              ),
                            );
                            updateDB();
                          }
                        },
                      );
                  });
                  Navigator.pushNamed(context, '/confirm');
                },
                child: Text(
                  'Оформить',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
