import 'package:flutter/material.dart';

import '../utiles/home_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    final _scaffKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffKey,
      drawer: const HomeScreenDrawer(),
      appBar: AppBar(
         backgroundColor: Colors.white,
         foregroundColor: Colors.black,
        centerTitle: false,
        title: Image.asset(
              "images/logo01.png",
              width: MediaQuery.of(context).size.width * 0.15,
            ),
      ),
    //  body: const Text('home screen')

    );
  }
}
