import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../global/globales.dart';

class Api {
  //----------------------------------------------------------------------------------
  // Funcion principal envia peticiones
  //----------------------------------------------------------------------------------
  //Parametros
  //url --- direccion del EndPoint
  //header --- cabecera de la peticion
  //data --- datos a enviar
  //Respuesta
  //
  //---  Ejemplo de llamada ----------------------------------------------------------
/*   
    String url = 'http:/www.cccc.com/ddd' 
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map data = {};
    data['username'] = identifier.trim().toLowerCase();
    data['password'] = passWord;
    await sendPost(url, headers, data);

 */

  Future<Map> sendPost(
      String url, Map<String, String> headers, Map data) async {
    //Convierto los datos a un json
    final msg = json.encode(data);

    //inicializo
    Map respuesta = {};

    try {
      var response = await post(Uri.parse(url), body: msg, headers: headers);
      Map<String, dynamic> respuestaApi = jsonDecode(response.body);

      respuesta = respuestaApi;

      respuesta['cod_resp'] = 200;
      respuesta['detalle'] = 'OK';

      //{data: null, error: {status: 400, name: ValidationError, message: Invalid identifier or password, details: {}}}
      if (respuestaApi.containsKey('error')) {
        respuesta['cod_resp'] = respuestaApi['error']['status'];
        respuesta['detalle'] = respuestaApi['error']['message'];
      }

     
    } catch (e) {
      respuesta['cod_resp'] = 900;
      respuesta['detalle'] = 'Error no previsto: $e';
    }

    return respuesta;
  }

  Future<Map> sendPostWithToken(String url, token, Map data) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    //Convierto los datos a un json
    final msg = json.encode(data);

    //inicializo
    Map respuesta = {};

    try {
      var response = await post(Uri.parse(url), body: msg, headers: headers);
      Map<String, dynamic> respuestaApi = jsonDecode(response.body);

      respuesta = respuestaApi;

        respuesta['cod_resp'] = 200;
      respuesta['detalle'] = 'OK';

      //{data: null, error: {status: 400, name: ValidationError, message: Invalid identifier or password, details: {}}}
      if (respuestaApi.containsKey('error')) {
        respuesta['cod_resp'] = respuestaApi['error']['status'];
        respuesta['detalle'] = respuestaApi['error']['message'];
      }


     
    } catch (e) {
      respuesta['cod_resp'] = 900;
      respuesta['detalle'] = 'Error: $e';
    }
    return respuesta;
  }

  //----------------------------------------------------------------------------
  // La respuesta debe ser un map con el resultado de la peticion
  //----------------------------------------------------------------------------
  //Llamada
  //Map respuesta = await loguinUser();
  //String token = respuesta['token'];
  //String cod_respuesta = respuesta['cod_resp']
  Future<Map> loguinUser(String identifier, String passWord) async {
    String url = Globales.urlLoguin;

    debugPrint(url);

    Map<String, String> headers = {'Content-Type': 'application/json'};

    Map data = {};
    data['identifier'] = identifier.trim().toLowerCase();
    data['password'] = passWord;

    return await sendPost(url, headers, data);
  }
}
