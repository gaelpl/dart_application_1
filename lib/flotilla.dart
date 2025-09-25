import 'package:dart_application_1/elemento.dart';
import 'package:dart_application_1/punto.dart';

enum TiposBarcos { bote, lancha, submarino, crucero, portaaviones }
enum DireccionesHacia { arriba, abajo, izquierda, derecha }

class Barco {
  final TiposBarcos tipo;
  final DireccionesHacia direccion;
  final Punto puntoInicial;
  List<Elemento> elementos = [];

  Barco({
    required this.tipo,
    required this.direccion,
    required this.puntoInicial,
  });

  Barco agregarBarco(Punto punto, TiposBarcos tipo, DireccionesHacia direccion) {
    int tamanio;
    switch (tipo) {
      case TiposBarcos.bote:
        tamanio = 1;
        break;
      case TiposBarcos.lancha:
        tamanio = 2;
        break;
      case TiposBarcos.submarino:
        tamanio = 3;
        break;
      case TiposBarcos.crucero:
        tamanio = 4;
        break;
      case TiposBarcos.portaaviones:
        tamanio = 5;
        break;
    }

    for (int i = 0; i < tamanio; i++) {
      switch (direccion) {
        case DireccionesHacia.arriba:
          elementos.add(
            Elemento(punto: Punto(columna: punto.columna, fila: punto.fila - i)),
          );
          break;
        case DireccionesHacia.abajo:
          elementos.add(
            Elemento(punto: Punto(columna: punto.columna, fila: punto.fila + i)),
          );
          break;
        case DireccionesHacia.izquierda:
          elementos.add(
            Elemento(punto: Punto(columna: punto.columna - i, fila: punto.fila)),
          );
          break;
        case DireccionesHacia.derecha:
          elementos.add(
            Elemento(punto: Punto(columna: punto.columna + i, fila: punto.fila)),
          );
          break;
      }
    }

    return this;
  }
}

class Flotilla {
  final List<Barco> _barcos;
  int get cantidad => _barcos.length;

  Flotilla(this._barcos) {
    if (!esCantidadCorrecta()) throw FlotillaCantidadException();
    if (!sonTiposCorrectos()) throw FlotillaTiposException();
    if (!estanPosicionAdecuada(_barcos)) throw FlotillaPosicionAdecuadaException();
    if (!estanSeparados(_barcos)) throw FlotillaPegadosException();
  }

  bool estanPosicionAdecuada(List<Barco> barcos) {
    return true;
  }

  bool esCantidadCorrecta() {
    return _barcos.length == 5;
  }

  bool sonTiposCorrectos() {
    return _barcos.map((b) => b.tipo).toSet().length == 5;
  }

  bool estanSeparados(List<Barco> barcos) {
  final puntos = barcos.expand((b) => b.elementos.map((e) => e.punto)).toList();

  for (int i = 0; i < puntos.length; i++) {
    for (int j = 0; j < puntos.length; j++) {
      if (i == j) continue; 

      final p1 = puntos[i];
      final p2 = puntos[j];

      final filaDiff = (p1.fila - p2.fila).abs();
      final colDiff = (p1.columna - p2.columna).abs();

      if (filaDiff <= 1 && colDiff <= 1) {
        return false; 
      }
    }
  }

  return true;
}
}


class FlotillaCantidadException extends Error {}

class FlotillaTiposException extends Error {}

class FlotillaPosicionAdecuadaException extends Error {}

class FlotillaPegadosException extends Error {}

