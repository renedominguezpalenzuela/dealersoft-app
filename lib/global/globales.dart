import 'package:dealersoft_app/model/car';

class Globales {
  static String version = "ver 0.01";

 //static String urlBase = 'http://localhost:1337/api';
  static String urlBase = 'http://10.0.2.2:1337/api';
  // static String urlBase = 'https://js-dealersoft-server.herokuapp.com/api';

  static String userName = "";
  static String email = "";
  static String token = "";
  static String pass = "";
  static int userID = 0;

  static List<Car> listaCars = [];
  static List<Car> listaVentas = [];
  static List<Car> listaCompras = [];

  static String get urlLoguin {
    return '$urlBase/auth/local';
  }

  //return 'http://localhost:1337/api/cars?filters[owner]=111&populate=*'
  static String get urlCarList {
    
    return '$urlBase/cars?filters[owner]=$userID&populate=*';
  }
}
