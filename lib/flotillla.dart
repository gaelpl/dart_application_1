
import 'package:dart_application_1/punto.dart';

enum TiposBarcos {bote, lancha ,submarino ,crucero, portaaviones}
enum DireccionesHacia {arriba, abajo, izquierda, derecha}

class Barco {
  final TiposBarcos tipo;
  final DireccionesHacia direccion;
  final Punto puntoInicial;
  Barco({
    required this.tipo,
    required this.direccion,
    required this.puntoInicial
  });
}


class Flotilla {
  List<Barco> _barcos;
  int get cantidad => _barcos.length;
  Flotilla(List<Barco>  this._barcos) {
    if(_barcos.length != 5) throw FlotillaCantidadException();
    if(_barcos.map((e) => e.tipo).toSet().length != 5) throw FlotillaTipos();
  }
}

class FlotillaCantidadException implements Exception {

}
class FlotillaTipos implements Exception {

}