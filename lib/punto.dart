import 'dart:math';

class Punto{
  final int columna;
  final int fila;

  Punto({required this.columna, required this.fila});

  int distancia(Punto otro){
    int dColumna = columna -otro.columna;
    int dFila = fila - otro.fila;
    num hipo = pow(dColumna, 2) + pow(dFila, 2);
    num raiz = sqrt(hipo);
    return raiz.toInt();
  }
}


  

