import 'package:flutter/material.dart';
import 'package:fluttersite/providers/BannerNotifier.dart';
import 'package:fluttersite/providers/MarkaNotifier.dart';
import 'package:fluttersite/providers/SayfaNotifier.dart';
import 'package:fluttersite/screens/login.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MarkaNotifier('vericeğin şey')),// böyle gider
      ChangeNotifierProvider(create: (context) => SayfaNotifier('vericeğin şey')),// böyle gider
      ChangeNotifierProvider(create: (context) => BannerNotifier('vericeğin şey')),// böyle gider
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Giris(),
      themeMode: ThemeMode.system,
    );
  }
}
