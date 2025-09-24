import 'package:test/test.dart';
import 'dart:math';
import 'package:dart_application_1/flotilla.dart';


void main() {
  test('Cuando creo una flotilla debe tener 5 tipos de barcos diferentes', (){
    Flotilla flotilla = Flotilla([Barco(),Barco()]);
    expect(flotilla.cantidad, equals(5));
    exp((x) => Flotilla([Barco(TiposBarcos.bote),Barco(TiposBarco.crucero)]), throwA(isA<FlotillaCantidadException>()));
  });
}