import 'package:dart_application_1/elemento.dart';
import 'package:dart_application_1/punto.dart';

import 'elemento.dart';
import 'punto.dart';

enum TiposBarcos {bote, lancha ,submarino ,crucero, portaaviones}
enum DireccionesHacia {arriba, abajo, izquierda, derecha}

class Barco {
  final TiposBarcos tipo;
  final DireccionesHacia direccion;
  final Punto puntoInicial;
  List<Elemento> elementos = [];
  Barco({
    required this.tipo,
    required this.direccion,
    required this.puntoInicial
  });
}


class Flotilla {
  List<Barco> _barcos;
  int get cantidad => _barcos.length;
  Flotilla(this._barcos){ 
  if(!esCantidadCorrecta()) throw FlotillaCantidadException();
  if(!sontiposCorrectos()) throw FlotillaTiposException();
  if(!EstanPosicionAdecuada()) throw FlotillaPosicionAdecuadaException;
  }
  

bool EstanPosicionAdecuada(List<Barco> barcos){
    return false;
}

bool esCantidadCorrecta(){
}

bool sontiposCorrectos(){
}


  /*Flotilla(List<Barco>  this._barcos) {
    if(_barcos.length != 5) throw FlotillaCantidadException();
    if(_barcos.map((e) => e.tipo).toSet().length != 5) throw FlotillaTipos();


  }*/
}

class FlotillaCantidadException extends Error {

}
class FlotillaTiposException extends Error {

}

class FlotillaPosicionAdecuadaException extends Error {

}

