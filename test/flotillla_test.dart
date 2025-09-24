import 'package:test/test.dart';
import 'dart:math';
import 'package:dart_application_1/flotilla.dart';


void main() {
  test('creaste un barco', (){
    Flotilla flotilla = Flotilla([Barco()]);
    expect(flotilla.cantidad, equals(1));
    expect((x) => Flotilla([Barco(TiposBarcos.values, DireccionesHacia.abajo, puntoInicial: ),Barco(TiposBarcos.values DireccionesHacia.values, Punto)]), throwsA(isA<FlotillaCantidadException>()));
  });
}