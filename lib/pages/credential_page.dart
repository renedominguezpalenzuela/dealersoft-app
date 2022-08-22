// ignore_for_file: unused_field

//import 'dart:ui';

import 'package:dealersoft_app/api/api.dart';
import 'package:dealersoft_app/global/globales.dart';
import 'package:dealersoft_app/utiles/dialogo_progreso.dart';
import 'package:dealersoft_app/utiles/mensaje_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CredentialPage extends StatefulWidget {
  const CredentialPage({Key? key}) : super(key: key);

  @override
  State<CredentialPage> createState() => _CredentialPageState();
}

class _CredentialPageState extends State<CredentialPage>
    with TickerProviderStateMixin, RestorationMixin {
  final _scaffKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

  final ctrUsuario = TextEditingController();
  final ctrPassword = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   passwordVisible = false;
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
        key: _scaffKey,
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Flexible(fit: FlexFit.tight, flex: 2, child: AreaSuperior()),
            Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: TabBar(
                      controller: tabController,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white54,
                      indicatorColor: Colors.white,
                      labelStyle: const TextStyle(fontSize: 20),
                      tabs: const [
                        Tab(
                          text: 'Registrieren',
                        ),
                        Tab(
                          text: 'Anmelden',
                        )
                      ]),
                )),
            Flexible(
                //   fit: FlexFit.tight,
                flex: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, right: 30, top: 20),
                  //------------------- TabBarView -------------------------------------
                  child: TabBarView(
                    controller: tabController,
                    children: [_formularioRegistro(), _formularioLogin()],
                  ),
                )),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Este es el fondo',
                      style: TextStyle(color: Colors.white)),
                  Text('Este es el tabo2',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            )),
          ],
        ));
  }

  @override
  String? get restorationId => 'loguin_screen';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {}

  Widget _formularioRegistro() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
      Text(
        'Este es el tabo1',
        style: TextStyle(color: Colors.white),
      ),
      Text('Este es el tabo2', style: TextStyle(color: Colors.white)),
    ]);
  }

  // Widget _formularioLogin() {

  // }

  InputDecoration _formatoTextFields(String hint) {
    return InputDecoration(
        hintStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(color: Colors.white),
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
              const BorderSide(width: 3, color: Colors.white), //<-- SEE HERE
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Color(0xFF9E92DC)),
          borderRadius: BorderRadius.circular(15),
        ));
  }

  Widget _formularioLogin() {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 40, right: 40),
            child: Column(
              children: [
                TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: _formatoTextFields('User or Email'),
                    onSaved: (valor) {
                      //Obteniendo valor del input
                      Globales.userName = valor!.trim().toLowerCase();
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      obscureText: !passwordVisible,
                      decoration: _formatoTextFields('Password'),
                      onSaved: (valor) {
                        //Obteniendo valor del input
                        Globales.pass = valor!.trim();
                      }),
                ),
                Row(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: Colors.white,
                      ),
                      child: Checkbox(
                          checkColor: Colors.white, // color of tick Mark
                          //      activeColor: Colors.transparent, //color cuando esta seleccionado

                          value: passwordVisible,
                          onChanged: ((bool? nuevoValor) {
                            setState(() {
                              passwordVisible = nuevoValor!;
                            });
                          })),
                    ),
                    const Text('Passwort anzeigen',
                        style: TextStyle(color: Colors.white))
                  ],
                ),
                _botonLogin()
              ],
            ),
          ),
        ));
  }

  Widget _botonLogin() {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                debugPrint("hola");
              },
              child: const Text(
                "Stattdessen anmelden",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
              )),
          SizedBox(
            height: 40,
            width: 110,
            child: MaterialButton(
                color: const Color(0xFF9E92DC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  // side: const BorderSide(color: Colors.red)
                ),
                child: const Text('Weiter',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                onPressed: () {
                  _loguin(context); //login
                }),
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
  Future<void> _loguin(BuildContext context) async {
    // int timeOuttime = Globales.timeOutTime;

    //Validaciones
    if (!_formKey.currentState!.validate()) {
      return;
    }

    DialogoProgreso dialogoProgreso = DialogoProgreso();
    dialogoProgreso.mostrar(context);

    //Obtengo los valores rn Globales.userName, Globales.pass
    _formKey.currentState!.save();

    Api api = Api();
    Map respuesta = {};

    respuesta = await api.loguinUser(Globales.userName, Globales.pass);

    if (kDebugMode) {
      print("RESPUESTA");
      print(respuesta);
    }

    int codRespuesta = respuesta['cod_resp'];

    String detalleRespuesta = respuesta['detalle'];

    if (codRespuesta != 200) {
      MensajeSnackBar.mostrar('$codRespuesta $detalleRespuesta', _scaffKey);
      dialogoProgreso.ocultar();
      return;
    }

    var token = respuesta['jwt'];
    Globales.token = token;

    dialogoProgreso.ocultar();

    debugPrint(Globales.token);

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: "AXL ROSES");
  }
}

/*
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
                    Text("Conectando...")
                  ],
                ),
              ));
        });
 */

class AreaSuperior extends StatelessWidget {
  const AreaSuperior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Align(
          alignment: const FractionalOffset(0.5, 0.1),
          child: Column(
            children: const [
              Text('Welcome',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        ));
  }
}

class AreaInferior extends StatelessWidget {
  const AreaInferior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 3,
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Align(
              alignment: FractionalOffset(0.5, 0.1),
              child: Text('Area inferior',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            )));
  }
}
