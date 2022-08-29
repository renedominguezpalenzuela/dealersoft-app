import 'package:dealersoft_app/utiles/format_date.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Fechas', () {
    String fecha = Fechas.parse('2000-01-01T04:00.00.000Z');
    if (kDebugMode) {
      print(fecha);
    }

    expect(fecha, '01.01.2000');


       fecha = Fechas.parse('2000-12-01T04:00.00.000Z');
    if (kDebugMode) {
      print(fecha);
    }

    expect(fecha, '01.12.2000');
  });
}
