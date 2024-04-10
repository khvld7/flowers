import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:taskflower/database/bouquet.dart';
import 'package:taskflower/globals.dart';

class CardWidget extends StatelessWidget {
  final Bouquet? flowerData;
  final Function() addBasket;
  final Function() onTapCard;

  CardWidget({
    super.key,
    required this.onTapCard,
    required this.flowerData,
    required this.addBasket,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCard,
      child: Container(
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
                  margin: EdgeInsets.all(12.0),
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
            Container(
              height: 36,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                flowerData?.name ?? '',
                style: TextStyle(
                    fontFamily: 'SF-Pro-Display',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    toMoney(flowerData?.price ?? 0) + ' руб.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'SF-Pro-Display',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    height: 24,
                    width: 24,
                    child: RawMaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: flowerData?.isBought == false
                          ? SvgPicture.asset(
                              'assets/icons/active_icon/basket_icon_active.svg')
                          : SvgPicture.asset('assets/icons/is_bought_icon.svg'),
                      onPressed: addBasket,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
