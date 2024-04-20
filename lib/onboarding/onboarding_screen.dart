import 'package:flutter/material.dart';
import 'package:taskflower/globals.dart';
import '../components/custom_button.dart';
import 'onboard_widget.dart';

class OboardingScreen extends StatefulWidget {
  const OboardingScreen({super.key});

  @override
  State<OboardingScreen> createState() => _OboardingScreenState();
}

int active_screen_id = 0;

class _OboardingScreenState extends State<OboardingScreen> {
  List<OnboardWidget> screenData = [
    OnboardWidget(
        screenId: 0,
        text: 'Цветы в горшках и готовые букеты',
        skipButton: true),
    OnboardWidget(
        screenId: 1,
        text: 'Конструктор букетов по вашим предпочтениям ',
        skipButton: true),
    OnboardWidget(
        screenId: 2,
        text: 'Удобное оформление и история заказов',
        skipButton: false)
  ];

  void nextScreen() {
    if (active_screen_id < 2) {
      active_screen_id += 1;
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/screens',
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 2),
                      color: Color.fromRGBO(212, 212, 212, 0.1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/system_image/onboarding_flowers_$active_screen_id.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        height: 0.5,
                        color: Color.fromRGBO(137, 106, 219, 1),
                      ),
                      Container(
                        child: Text(
                          active_screen_id != 3
                              ? screenData[active_screen_id].text ?? ''
                              : '',
                          style: TextStyle(
                            fontFamily: 'SF-Pro-Display',
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (screenData[active_screen_id].skipButton == true)
                  CustomButton(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    height: 36,
                    textColor: Colors.black,
                    border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(137, 106, 219, 1),
                    ),
                    onPressed: () {
                      setState(() {
                        active_screen_id = 2;
                      });
                    },
                    child: Text(
                      'Пропустить',
                    ),
                  ),
                active_screen_id == 2
                    ? Padding(padding: EdgeInsets.zero)
                    : Padding(padding: EdgeInsets.symmetric(horizontal: 30)),
                CustomButton(
                    padding: active_screen_id == 2
                        ? EdgeInsets.symmetric(horizontal: 130)
                        : EdgeInsets.symmetric(horizontal: 30),
                    color: Color.fromRGBO(137, 106, 219, 1),
                    height: 36,
                    onPressed: () {
                      setState(() {
                        nextScreen();
                      });
                    },
                    child:
                        active_screen_id == 2 ? Text('Начать') : Text('Далее')),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            RawMaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: launchURL,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Условия использования ',
                      style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'SF-Pro-Display',
                          color: Color.fromRGBO(161, 167, 176, 1)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(137, 106, 219, 1),
                    ),
                    width: 1,
                    height: 10,
                  ),
                  Text(
                    ' Политика конфиденциальности',
                    style: TextStyle(
                        fontSize: 8,
                        fontFamily: 'SF-Pro-Display',
                        color: Color.fromRGBO(161, 167, 176, 1)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            )
          ],
        ),
      ),
    );
  }
}
