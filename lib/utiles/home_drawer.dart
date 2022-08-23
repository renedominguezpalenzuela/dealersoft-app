// ignore: unused_import
import 'package:dealersoft_app/global/globales.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
// import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenDrawer extends StatefulWidget {
  const HomeScreenDrawer({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenDrawerState createState() => _HomeScreenDrawerState();
}

class _HomeScreenDrawerState extends State<HomeScreenDrawer> {
  final double tamanoIconos = 20;

  TextStyle estiloTextoMenu() {
    return const TextStyle(fontSize: 18, );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              "images/logo01.png",
              width: MediaQuery.of(context).size.width * 0.15,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/new_car');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset('images/menu/neue_rechnung.png',
                      width: tamanoIconos,
                      height: tamanoIconos,
                      color: Colors.black87),
                ),
                Text('Neues Fahrzeug', style: estiloTextoMenu())
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/my_stock');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 28, top: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset('images/menu/mein_bestand.png',
                      width: tamanoIconos,
                      height: tamanoIconos,
                      color: Colors.black87),
                ),
                Text('Mein Bestand', style: estiloTextoMenu())
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/allcars');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 28, top: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset('images/menu/alle_fahrzeuge.png',
                      width: tamanoIconos,
                      height: tamanoIconos,
                      color: Colors.black87),
                ),
                Text('Alle Fahrseuge', style: estiloTextoMenu())
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/persons');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 28, top: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset('images/menu/kundendaten.png',
                      width: tamanoIconos,
                      height: tamanoIconos,
                      color: Colors.black87),
                ),
                Text('Kundendaten', style: estiloTextoMenu())
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/persons');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 28, top: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset('images/menu/ein-verkauf.png',
                      width: tamanoIconos,
                      height: tamanoIconos,
                      color: Colors.black87),
                ),
                Text('Ein- & Verkauf', style: estiloTextoMenu())
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/persons');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 28, top: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset('images/menu/gewinn-und_verlust.png',
                      width: tamanoIconos,
                      height: tamanoIconos,
                      color: Colors.black87),
                ),
                Text('Gewinn- und Verlust', style: estiloTextoMenu())
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/persons');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 28, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset('images/menu/neue_rechnung.png',
                      width: tamanoIconos,
                      height: tamanoIconos,
                      color: Colors.black87),
                ),
                Text('Diverse Rechnung', style: estiloTextoMenu())
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/persons');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 28, top: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset('images/menu/gewinn-und_verlust.png',
                      width: tamanoIconos,
                      height: tamanoIconos,
                      color: Colors.black87),
                ),
                Text('Alle Rechnungen', style: estiloTextoMenu())
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Globales.userName = '';
            Globales.email = '';
            Globales.pass = '';
            Globales.token = '';

            Navigator.pushReplacementNamed(context, '/credentials');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 28, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset('images/menu/kundendaten.png',
                      width: tamanoIconos,
                      height: tamanoIconos,
                      color: Colors.black87),
                ),
                Text('Logout', style: estiloTextoMenu())
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
