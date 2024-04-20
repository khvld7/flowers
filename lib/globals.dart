import 'package:flutter/material.dart';
import 'package:taskflower/components/card_dialog.dart';
import 'package:taskflower/components/custom_button.dart';
import 'package:taskflower/database/bouquet.dart';
import 'package:url_launcher/url_launcher.dart';

toMoney(int value) {
  String result = value.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]} ',
      );
  return result;
}

showCardDialog(
    {required BuildContext context,
    Bouquet? flowerData,
    required Function() addBasket}) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 35,
              textColor: Colors.black,
              border: Border.all(
                color: Color.fromRGBO(137, 106, 219, 1),
              ),
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Закрыть',
                style: TextStyle(
                    fontFamily: 'SF-Pro-Display',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            CustomButton(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 35,
              color: Color.fromRGBO(137, 106, 219, 1),
              onPressed: addBasket,
              child: Text(
                'В корзину',
                style: TextStyle(
                    fontFamily: 'SF-Pro-Display',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        )
      ],
      content: CardDialogWidget(
        flowerData: flowerData,
      ),
    ),
  );
}

launchURL() async {
  final Uri url = Uri.parse('https://flutter.dev');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
