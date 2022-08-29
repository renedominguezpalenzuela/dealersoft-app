// ignore: unused_import
import 'package:dealersoft_app/api/api.dart';
import 'package:dealersoft_app/utiles/format_date.dart';
import 'package:dealersoft_app/utiles/home_drawer.dart';
import 'package:dealersoft_app/utiles/scrollable_widget.dart';
import 'package:flutter/material.dart';
import 'package:dealersoft_app/model/car';

import '../global/globales.dart';

import 'package:intl/intl.dart';
// ignore: unused_import
import 'package:intl/date_symbol_data_local.dart';

//http://localhost:1337/api/cars?filters[owner]=111

class AllCars extends StatefulWidget {
  const AllCars({Key? key}) : super(key: key);

  @override
  State<AllCars> createState() => _AllCarsState();
}

class _AllCarsState extends State<AllCars> {
  final _scaffKey = GlobalKey<ScaffoldState>();

  List<Car> cars = [];
  List<Car> carrosSeleccionados = [];

  @override
  void initState() {
    Intl.defaultLocale = 'de_DE';
    super.initState();

    init();
  }

  Future init() async {
    initializeDateFormatting('de_DE', null);
    //final DateFormat formatter = DateFormat('yyyy-MM-dd');
    //List<Car> carros = await Utils.loadCars();
    List<Car> carros = [];
    // carros.add(const Car(code: 'LADA', name: 'ladaNAME', nativeName: 'sssss'));

    Api api = Api();
    var respuesta = await api.getListaCarros(Globales.token);

    var codRespuesta = respuesta['cod_resp'];

    if (codRespuesta == 200) {
      var datos = respuesta['data2'];

      int totalElementos = datos.length;
      for (var i = 0; i < totalElementos; i++) {
        Map unElemento = {};
        unElemento = datos[i];

        Map data = unElemento['attributes'];

        Car unCarro = Car(
            id: unElemento['id'],
            name: data['name'],
            car_identifier: data['car_identifier'],
            build_variant: data['build_variant'],
            first_register_date:Fechas.parse(data['first_register_date']),
            kilometres: data['kilometres']+' Km',
            kilowatt: data['kilowatt']+ ' Kw',
            color: data['color'],
            last_owner: data['last_owner'],
            hsn: data['hsn'],
            tsn: data['tsn']);

        carros.add(unCarro);
      }

      setState(() {
        cars = carros;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: ScrollableWidget(child: buildDataTable()));
  }

  Widget buildDataTable() {
    final columns = [
      '',
      'FAHRZEUGNAME',
      'FIN',
      'ERSTZULASSUNG',
      'KILOMETER',
      'KILOWATT'
    ];

    return DataTable(columns: getColumns(columns), rows: getRows(cars));
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();

  List<DataRow> getRows(List<Car> cars) => cars
      .map((Car car) => DataRow(cells: [
            DataCell(TextButton(
              onPressed: () {
                // debugPrint(car.name);
              },
              child: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            )),
            DataCell(SizedBox(width: 50, child: Text(car.name))),
            DataCell(SizedBox(width: 100, child: Text(car.car_identifier))),
            DataCell(
                SizedBox(width: 100, child: Text(car.first_register_date))),
            DataCell(SizedBox(width: 100, child: Text(car.kilometres))),
            DataCell(SizedBox(width: 100, child: Text(car.kilowatt)))
          ]))
      .toList();
}
