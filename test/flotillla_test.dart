import 'package:test/test.dart';
import 'package:dart_application_1/flotilla.dart';
import 'package:dart_application_1/punto.dart';

void main() {
  test('Debe crear flotilla correctamente con 5 barcos de distintos tipos', () {
    final flotilla = Flotilla([
      Barco(
        tipo: TiposBarcos.bote,
        direccion: DireccionesHacia.arriba,
        puntoInicial: Punto(columna: 0, fila: 0),
      ),
      Barco(
        tipo: TiposBarcos.lancha,
        direccion: DireccionesHacia.abajo,
        puntoInicial: Punto(columna: 1, fila: 0),
      ),
      Barco(
        tipo: TiposBarcos.submarino,
        direccion: DireccionesHacia.izquierda,
        puntoInicial: Punto(columna: 2, fila: 0),
      ),
      Barco(
        tipo: TiposBarcos.crucero,
        direccion: DireccionesHacia.derecha,
        puntoInicial: Punto(columna: 3, fila: 0),
      ),
      Barco(
        tipo: TiposBarcos.portaaviones,
        direccion: DireccionesHacia.arriba,
        puntoInicial: Punto(columna: 4, fila: 0),
      ),
    ]);

    expect(flotilla.cantidad, equals(5));
  });

  test('Lancha de tamaño 2 hacia la derecha desde (1,1)', () {
    var barco = Barco(
      tipo: TiposBarcos.lancha,
      direccion: DireccionesHacia.derecha,
      puntoInicial: Punto(columna: 1, fila: 1),
    );

    var nuevoBarco = barco.agregarBarco(
      Punto(columna: 1, fila: 1),
      TiposBarcos.lancha,
      DireccionesHacia.derecha,
    );

    expect(nuevoBarco.elementos.length, 2);

    expect(nuevoBarco.elementos[0].punto.columna, 1);
    expect(nuevoBarco.elementos[0].punto.fila, 1);

    expect(nuevoBarco.elementos[1].punto.columna, 2);
    expect(nuevoBarco.elementos[1].punto.fila, 1);
  });

  test('no pueden estar pegados los barcos', () {
  expect(
    () => Flotilla([
      Barco(
        tipo: TiposBarcos.bote,
        direccion: DireccionesHacia.abajo,
        puntoInicial: Punto(columna: 1, fila: 1),
      )..agregarBarco(Punto(columna: 1, fila: 1), TiposBarcos.bote, DireccionesHacia.abajo),
      Barco(
        tipo: TiposBarcos.lancha,
        direccion: DireccionesHacia.abajo,
        puntoInicial: Punto(columna: 1, fila: 2),
      )..agregarBarco(Punto(columna: 1, fila: 2), TiposBarcos.lancha, DireccionesHacia.abajo),
    ]),
    throwsA(isA<FlotillaPegadosException>()),
  );
});


}
