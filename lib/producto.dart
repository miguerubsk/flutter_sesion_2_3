enum Importancia{
  baja('Baja'),
  media('Media'),
  alta('Alta');

  final String _nombre;
  String get nombre => _nombre;
  const Importancia(this._nombre);
}

class Producto{
  final String id, nombre;
  final Importancia importancia;
  final int cantidad;
  final bool completado;

  //Constructor
  Producto({
    required this.id,
    required this.nombre,
    required this.importancia,
    required this.cantidad,
    this.completado = false,
  });

  Producto copiaSiNulo({
    String? id,
    String? nombre,
    Importancia? importancia,
    int? cantidad,
    bool? completado,
    }) {
    return Producto(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      importancia: importancia ?? this.importancia,
      cantidad: cantidad ?? this.cantidad,
      completado: completado ?? this.completado,
    );
  }

}