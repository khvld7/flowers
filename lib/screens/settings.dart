import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:taskflower/globals.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void markApp() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.openStoreListing(appStoreId: '...', microsoftStoreId: '...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                'Настройки',
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
      body: Padding(
        padding: EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 2),
                    color: Color.fromRGBO(212, 212, 212, 0.1),
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              padding: EdgeInsets.symmetric(horizontal: 18),
              height: 48,
              child: RawMaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: launchURL,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Политика конфиденциальности'),
                    SvgPicture.asset('assets/icons/lock_icon.svg')
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 2),
                      color: Color.fromRGBO(212, 212, 212, 0.1),
                    ),
                  ]),
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              padding: EdgeInsets.symmetric(horizontal: 18),
              height: 48,
              child: RawMaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: launchURL,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Пользовательское соглашение'),
                    SvgPicture.asset('assets/icons/verify_icon.svg'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                color: Color.fromRGBO(137, 106, 219, 1),
                height: 1,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 2),
                      color: Color.fromRGBO(212, 212, 212, 0.1),
                    ),
                  ]),
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              padding: EdgeInsets.symmetric(horizontal: 18),
              height: 48,
              child: RawMaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: markApp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Оценить приложение'),
                    SvgPicture.asset('assets/icons/marks_icon.svg'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
