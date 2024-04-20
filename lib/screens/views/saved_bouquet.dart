import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskflower/adapter/hive_adapter.dart';
import 'package:taskflower/components/custom_button.dart';
import 'package:taskflower/components/custom_checkbox.dart';
import 'package:taskflower/database/database.dart';
import 'package:taskflower/globals.dart';

class SavedBouquet extends StatefulWidget {
  SavedBouquet({
    super.key,
  });

  @override
  State<SavedBouquet> createState() => _SavedBouquetState();
}

class _SavedBouquetState extends State<SavedBouquet> {
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
              'Сохраненные букеты',
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
      body: ValueListenableBuilder(
          valueListenable: saveBox.listenable(),
          builder: (BuildContext context, Box<SaveDB> saveBox, _) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: saveBox.length != 0
                    ? ListView.builder(
                        itemCount: saveBox.length,
                        itemBuilder: (BuildContext context, int index) {
                          final saveGet = saveBox.getAt(index);
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
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 10),
                                        child: CustomCheckbox(
                                          isActive: saveGet!.saveDB.isSaved,
                                          onChanged: () {
                                            setState(() {
                                              saveBox.putAt(
                                                index,
                                                SaveDB(
                                                  saveDB: DataBase(
                                                    id: saveGet.saveDB.id,
                                                    isSaved:
                                                        !saveGet.saveDB.isSaved,
                                                    type: saveGet.saveDB.type,
                                                    categoryId: saveGet
                                                        .saveDB.categoryId,
                                                    image: saveGet.saveDB.image,
                                                    name: saveGet.saveDB.name,
                                                    price: saveGet.saveDB.price,
                                                    about: saveGet.saveDB.about,
                                                    isBought:
                                                        saveGet.saveDB.isBought,
                                                    count: saveGet.saveDB.count,
                                                    total: saveGet.saveDB.total,
                                                  ),
                                                ),
                                              );
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          saveBox.getAt(index)!.saveDB.name!,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'SF-Pro-Display'),
                                        ),
                                      ),
                                      CustomButton(
                                          width: 24,
                                          height: 24,
                                          onPressed: () {},
                                          child: SvgPicture.asset(
                                              'assets/icons/edit_icon.svg')),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: CustomButton(
                                          width: 24,
                                          height: 24,
                                          onPressed: () => showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                shape: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                alignment: Alignment.center,
                                                title: Center(
                                                  child: Text(
                                                    'Удаление',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.red,
                                                        fontFamily:
                                                            'SF-Pro-Display'),
                                                  ),
                                                ),
                                                content: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  child: Text(
                                                    'Вы действительно хотите удалить букет?',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            'SF-Pro-Display'),
                                                  ),
                                                ),
                                                actions: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      CustomButton(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        height: 35,
                                                        textColor: Colors.black,
                                                        border: Border.all(
                                                          color: Color.fromRGBO(
                                                              137, 106, 219, 1),
                                                        ),
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(),
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
                                                                horizontal: 20),
                                                        height: 35,
                                                        color: Colors.red,
                                                        onPressed: () {
                                                          setState(() {
                                                            saveBox.deleteAt(
                                                                index);
                                                          });
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                          'Удалить',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'SF-Pro-Display',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              );
                                            },
                                          ),
                                          child: SvgPicture.asset(
                                            'assets/icons/trash_icon.svg',
                                            colorFilter: ColorFilter.mode(
                                                Colors.red, BlendMode.srcIn),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 60, vertical: 5),
                                  child: Text(
                                    toMoney(
                                        saveBox.getAt(index)!.saveDB.total!),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'SF-Pro-Display'),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/system_image/empty_basket.png',
                              fit: BoxFit.contain,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 10)),
                            Text(
                              'Нет сохраненных букетов',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(123, 123, 123, 1)),
                            ),
                          ],
                        ),
                      ));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                isActive: saveBox.values
                    .any((element) => element.saveDB.isSaved == true),
                color: Color.fromRGBO(137, 106, 219, 1),
                height: 36,
                onPressed: () {
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
