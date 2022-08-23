// ignore: unused_import
import 'package:dealersoft_app/utiles/home_drawer.dart';
import 'package:dealersoft_app/utiles/scrollable_widget.dart';
import 'package:flutter/material.dart';
import 'package:dealersoft_app/model/car';

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
    super.initState();

    init();
  }

  Future init() async {
    //List<Car> carros = await Utils.loadCars();
    List<Car> carros = [];
    carros.add(const Car(code: 'LADA', name: 'ladaNAME', nativeName: 'sssss'));
    carros.add(const Car(code: 'Ford', name: 'fordNAME', nativeName: 'xxxx'));
    carros.add(const Car(code: 'VW', name: 'wwNAME', nativeName: 'gggg'));
    carros.add(const Car(code: 'LADA', name: 'ladaNAME', nativeName: 'sssss'));
    carros.add(const Car(code: 'Ford', name: 'fordNAME', nativeName: 'xxxx'));
    carros.add(const Car(code: 'VW', name: 'wwNAME', nativeName: 'gggg'));
    carros.add(const Car(code: 'LADA', name: 'ladaNAME', nativeName: 'sssss'));
    carros.add(const Car(code: 'Ford', name: 'fordNAME', nativeName: 'xxxx'));
    carros.add(const Car(code: 'VW', name: 'wwNAME', nativeName: 'gggg'));
    carros.add(const Car(code: 'LADA', name: 'ladaNAME', nativeName: 'sssss'));
    carros.add(const Car(code: 'Ford', name: 'fordNAME', nativeName: 'xxxx'));
    carros.add(const Car(code: 'VW', name: 'wwNAME', nativeName: 'gggg'));
    carros.add(const Car(code: 'LADA', name: 'ladaNAME', nativeName: 'sssss'));
    carros.add(const Car(code: 'Ford', name: 'fordNAME', nativeName: 'xxxx'));
    carros.add(const Car(code: 'VW', name: 'wwNAME', nativeName: 'gggg'));
    carros.add(const Car(code: 'LADA', name: 'ladaNAME', nativeName: 'sssss'));
    carros.add(const Car(code: 'Ford', name: 'fordNAME', nativeName: 'xxxx'));
    carros.add(const Car(code: 'VW', name: 'wwNAME', nativeName: 'gggg'));
    carros.add(const Car(code: 'LADA', name: 'ladaNAME', nativeName: 'sssss'));
    carros.add(const Car(code: 'Ford', name: 'fordNAME', nativeName: 'xxxx'));
    carros.add(const Car(code: 'VW', name: 'wwNAME', nativeName: 'gggg'));
    carros.add(const Car(code: 'LADA', name: 'ladaNAME', nativeName: 'sssss'));
    carros.add(const Car(code: 'Ford', name: 'fordNAME', nativeName: 'xxxx'));
    carros.add(const Car(code: 'VW', name: 'wwNAME', nativeName: 'gggg'));

    setState(() {
      cars = carros;
    });
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
    final columns = ['','Flag', 'Name', 'Native name'];

    return DataTable(columns: getColumns(columns), rows: getRows(cars));
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();

  List<DataRow> getRows(List<Car> cars) => cars
      .map((Car car) => DataRow(
              //        selected:  carrosSeleccionados.contains(car),
              //  onSelectChanged: (isSelected)=>   setState(() {
              //                     final isAdding = isSelected!=null && isSelected;
              //                     isAdding ? carrosSeleccionados.add(car) : carrosSeleccionados.remove(car);
              //         }),

              cells: [
                DataCell(TextButton(
                        onPressed: () {
                          debugPrint(car.name);
                        },
                        child: const Icon(Icons.arrow_forward_ios, color: Colors.black), )),
               
                DataCell(SizedBox(width: 50, child: Text(car.code))),
                 DataCell(Text(car.name)),
                DataCell(SizedBox(width: 100, child: Text(car.nativeName))),
              ]))
      .toList();
}
