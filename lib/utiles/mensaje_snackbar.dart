
import 'package:flutter/material.dart';

class MensajeSnackBar {


static   void mostrar(String texto,  GlobalKey<ScaffoldState> scaffKey) {
    SnackBar snackbar = SnackBar(content: Text(texto)
    , duration: const Duration(seconds: 5, milliseconds: 500),
    );

    
    // ignore: deprecated_member_use
    scaffKey.currentState!.showSnackBar(snackbar);
  }
 
}
