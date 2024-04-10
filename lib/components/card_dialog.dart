import 'package:flutter/material.dart';
import 'package:taskflower/database/bouquet.dart';
import 'package:taskflower/globals.dart';

class CardDialogWidget extends StatelessWidget {
  final Bouquet? flowerData;

  const CardDialogWidget({
    required this.flowerData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 345,
      width: 327,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          Center(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    flowerData?.image ?? '',
                    fit: BoxFit.contain,
                  ),
                ),
                width: 107,
                height: 107),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    flowerData?.name ?? '',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        fontFamily: 'SF-Pro-Display'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  toMoney(flowerData?.price ?? 0) + ' руб.',
                  style: TextStyle(
                      fontFamily: 'SF-Pro-Display',
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Divider(
              height: 1,
              color: Color.fromRGBO(137, 106, 219, 1),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              flowerData?.about ?? '',
              style: TextStyle(
                  color: Color.fromRGBO(123, 123, 123, 1),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  fontSize: 14,
                  fontFamily: 'SF-Pro-Display'),
            ),
          )
        ],
      ),
    );
  }
}
