import 'package:dealersoft_app/pages/all_cars_page.dart';
import 'package:dealersoft_app/pages/credential_page.dart';
import 'package:dealersoft_app/pages/home_page.dart';
import 'package:dealersoft_app/pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DealerSoft',
        theme: ThemeData(fontFamily: 'Open Sans'),
    //    initialRoute: "/splash",
        initialRoute: "/home",

        //Definir rutas
        routes: {
          "/splash": (BuildContext context) => const SplashScreen(),
          "/home": (BuildContext context) {  return const HomePage(); },
          "/credentials": (BuildContext context) => const CredentialPage(),
          "/allcars":(BuildContext context) => const AllCars()
        });
  }
}
