import 'package:flutter/material.dart';

enum Importancia{
  baja('Baja', Colors.black),
  media('Media', Colors.orangeAccent),
  alta('Alta', Colors.red);

  final String _nombre;
  final Color _color;
  String get nombre => _nombre;
  Color get color => _color;
  const Importancia(this._nombre, this._color);
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

  @override
  String toString() {
    return '$id;$nombre;$importancia;$cantidad;$completado';
  }
}