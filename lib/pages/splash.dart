// import 'dart:ui';

import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Center(child:Image.asset('images/logo02.png', width: 200 ,)),
          const SizedBox(height: 50),


          const Center(child: Text('Unsere Software', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),),
           const SizedBox(height:5),
          const Center(child: Text('revolutioniert Ihren Autohandel.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),)
         
             

            
          
        ],
      )
    );
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3),(){
      debugPrint("3 segundos");
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));

      //comprobar si esta logueado automaticamente si si ir a home
      //si no ir a login
      //logout ir a login nuevamente
      Navigator.pushReplacementNamed(context, '/credentials');


    });
    super.initState();
  }
}

   

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: FlutterLogo(size: 200

//             ),
//           ),
//         ],
//       )
//     );
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     Future.delayed(Duration(seconds: 3),(){
//       print("3 segundos");
//       //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
//       Navigator.pushReplacementNamed(context, '/home');


//     });
//     super.initState();
//   }
// }
