import 'package:flutter/material.dart';

class DialogoProgreso {
  late BuildContext contexto;

   void mostrar(BuildContext context) {
    contexto = context;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              content: SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CircularProgressIndicator(),
                    //Spacer(), //
                    Text("Conecting...")
                  ],
                ),
              ));
        });
  }

  void ocultar(){
      Navigator.pop(contexto); //cerrar dialog
  }
}
