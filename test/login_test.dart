// ignore_for_file: avoid_print

import 'package:dealersoft_app/api/api.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:test/test.dart';

void main() {
  test('Counter value should be incremented', () {
    int v = 1;

    //Crear instancia de la clase a probar
    // final counter = Counter();
    //Ejecuto la funcion a probar
    // counter.increment();
    //valido el resultado de la funcion
    expect(v, 1);
  });

  test('Future.value() returns the value', () async {
    var value = await Future.value(10);
    expect(value, equals(10));
  });

// ignore: unused_element
  void isNull(dynamic param) {
    assert(param == null);
  }

  test('login test', () async {
    Api api = Api();
    Map respuesta = {};
    respuesta = await api.loguinUser('axl', 'Abcd1234');
    //if (kDebugMode) {

    // print(respuesta);
    //}
    var token = respuesta['jwt'];
    print(token);

    expect(() => isNull(token), throwsAssertionError);

    var user = respuesta['user'];

    // print(user);

    print(user['username']);
    print(user['email']);
    

    expect(() => isNull(user), throwsAssertionError);

  });
}
