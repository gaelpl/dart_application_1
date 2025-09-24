class Barco {
  final String tipo;
  Barco(this.tipo);
}


class Flotilla {
  List<Barco> _barcos;
  int get cantidad => _barcos.length;
  Flotilla(List<Barco>  this._barcos) {
    if(_barcos.length != 5) throw FlotillaCantidadException();
    if(_barcos.map((e) => e.tipo).toSet().length != 5) throw FlotillaTipos();
  }
}

class FlotillaCantidadException extend Error {

}
class FlotillaTipos implements Error {

}