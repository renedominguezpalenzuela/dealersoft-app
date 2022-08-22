class Globales {
  static String version = "ver 0.01";

  //static String urlBase = 'http://localhost:1337/api';
  static String urlBase = 'http://10.0.2.2:1337/api';
 // static String urlBase = 'https://js-dealersoft-server.herokuapp.com/api';

  static String userName = "";
  static String email = "";
  static String token = "";
  static String pass = "";

  static String get urlLoguin {
    return '$urlBase/auth/local';
  }


}
