import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskflower/globals.dart';

class CardConstructor extends StatelessWidget {
  final String image;
  final String name;
  int price;
  int count;

  final Function() onPlus;
  final Function() onMinus;

  CardConstructor({
    required this.onPlus,
    required this.onMinus,
    required this.image,
    required this.name,
    this.price = 0,
    this.count = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(1, 2),
          color: Color.fromRGBO(212, 212, 212, 0.1),
        )
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      width: 156,
      height: 209,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
                width: 107,
                height: 107),
          ),
          Container(
            height: 24,
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontFamily: 'SF-Pro-Display',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    toMoney(price) + ' руб.',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontFamily: 'SF-Pro-Display',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RawMaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  constraints: BoxConstraints.loose(Size.infinite),
                  onPressed: onMinus,
                  child: SvgPicture.asset('assets/icons/minus_icon.svg')),
              Text('${count}',
                  style: TextStyle(
                      color: count == 0
                          ? Color.fromARGB(123, 123, 123, 1)
                          : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              RawMaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  constraints: BoxConstraints.loose(Size.infinite),
                  onPressed: onPlus,
                  child: SvgPicture.asset('assets/icons/plus_icon.svg')),
            ],
          )
        ],
      ),
    );
  }
}