class Fechas {
  static String parse(String fecha) {
    return '${fecha.substring(8, 10)}.${fecha.substring(5, 7)}.${fecha.substring(0, 4)}';
  }
}
