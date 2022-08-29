

import 'package:dealersoft_app/api/api.dart';
import 'package:dealersoft_app/model/car';
// import 'package:dealersoft_app/global/globales.dart';
// import 'package:dealersoft_app/model/car';
// import 'package:flutter/foundation.dart';

import 'package:flutter_test/flutter_test.dart';
//import 'package:test/test.dart';

void main() {
  test('get cars test', () async {
    Api api = Api();
    Map respuesta = {};
    respuesta = await api.loguinUser('axl', 'Abcd1234');

    var codRespuesta = respuesta['cod_resp'];

    expect(codRespuesta, 200, reason: 'Error: login in get Cars');

    List<Car> listaCarros = [];

    if (codRespuesta == 200) {
      // ignore: unused_local_variable
      var token = respuesta['jwt'];

          
      var respuesta2 = await api.getListaCarros(token);

      var codRespuesta2 = respuesta2['cod_resp'];

     expect(codRespuesta2, 200, reason: 'Error get Cars');


      var datos = respuesta2['data2'];



   
    int totalElementos = datos.length;
    for (var i = 0; i < totalElementos; i++) {
      Map unElemento = {};
      unElemento = datos[i];

      Map data = unElemento['attributes'];

      Car unCarro = Car(
          id: unElemento['id'],
          name: data['name'],
          car_identifier: data['car_identifier']);

      listaCarros.add(unCarro);
    }



   
    
    }
       

//     expect(listaCarros.length, greaterThanOrEqualTo(0), reason: 'Error: no devuelve carros');
     expect(listaCarros.length, greaterThan(0), reason: 'Error: no devuelve carros');
     
   
  });
}
