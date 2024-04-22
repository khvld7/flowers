import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskflower/adapter/hive_adapter.dart';
import 'package:taskflower/client/hive_names.dart';
import 'package:taskflower/database/database.dart';
import 'package:taskflower/screens/screens.dart';
import 'package:taskflower/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:taskflower/screens/views/confirm.dart';
import 'package:taskflower/screens/views/constructor.dart';
import 'package:taskflower/screens/views/finished_bouquet.dart';
import 'package:taskflower/screens/views/flower_all.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskflower/screens/views/saved_bouquet.dart';

int? initScreen;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataBaseAdapter());
  await Hive.openBox<DataBase>(HiveBoxes.dataBase);
  if (box.isEmpty) addFlowers();
  Hive.registerAdapter(SaveDBAdapter());
  await Hive.openBox<SaveDB>(HiveBoxes.saveDataBase);
  Hive.registerAdapter(HistoryDBAdapter());
  await Hive.openBox<HistoryDB>(HiveBoxes.historyDataBase);
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Color.fromRGBO(249, 249, 251, 1)),
        home: ScreenUtilInit(
            minTextAdapt: true,
            designSize: Size(360, 690),
            splitScreenMode: true,
            builder: (context, child) => OboardingScreen()),
        routes: {
          '/onboarding': (context) => OboardingScreen(),
          '/screens': (context) => Screens(),
          '/flowerall': (context) => FlowerAll(),
          '/finishedall': (context) => FinishedAll(),
          '/constructor': (context) => Constructor(),
          '/confirm': (context) => ConfirmWidget(),
          '/saved_bouquet': (context) => SavedBouquet(),
        },
        initialRoute:
            initScreen == 0 || initScreen == null ? '/onboarding' : '/screens');
  }
}
