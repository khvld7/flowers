import 'package:flutter/material.dart';
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                  color: Color.fromRGBO(212, 212, 212, 1),
                  height: 36,
                  onPressed: () {},
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: Text(
                        'Перейти в каталог',
                      )),
                ),
              ),
            ],
          ),
        ),
        body: Center(
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
        ));
  }
}
