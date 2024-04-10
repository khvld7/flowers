import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskflower/screens/basket.dart';
import 'package:taskflower/screens/catalog.dart';
import 'package:taskflower/screens/history.dart';
import 'package:taskflower/screens/settings.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            CatalogScreen(),
            BasketScreen(),
            HistoryScreen(),
            SettingsScreen(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          indicatorColor: Colors.transparent,
          selectedIndex: _selectedIndex,
          backgroundColor: Colors.white,
          onDestinationSelected: (index) {
            setState(() => _selectedIndex = index);
          },
          destinations: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: NavigationDestination(
                  selectedIcon: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/active_icon/catalog_icon_active.svg',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Каталог',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'SF-Pro-Display',
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(137, 106, 219, 1),
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromRGBO(137, 106, 219, 1),
                          ),
                        ),
                      )
                    ],
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/catalog_icon.svg',
                  ),
                  label: ''),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: NavigationDestination(
                  selectedIcon: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/active_icon/basket_icon_active.svg',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Корзина',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'SF-Pro-Display',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            color: Color.fromRGBO(137, 106, 219, 1),
                            decorationColor: Color.fromRGBO(137, 106, 219, 1),
                          ),
                        ),
                      )
                    ],
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/basket_icon.svg',
                  ),
                  label: ''),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: NavigationDestination(
                  selectedIcon: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/active_icon/history_icon_active.svg',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'История',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'SF-Pro-Display',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            color: Color.fromRGBO(137, 106, 219, 1),
                            decorationColor: Color.fromRGBO(137, 106, 219, 1),
                          ),
                        ),
                      )
                    ],
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/history_icon.svg',
                  ),
                  label: ''),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 0),
              child: NavigationDestination(
                  selectedIcon: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/active_icon/settings_icon_active.svg',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Настройки',
                          style: TextStyle(
                            color: Color.fromRGBO(137, 106, 219, 1),
                            fontSize: 12,
                            fontFamily: 'SF-Pro-Display',
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromRGBO(137, 106, 219, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/settings_icon.svg',
                  ),
                  label: ''),
            ),
          ],
        ));
  }
}
