import 'package:flutter/cupertino.dart';
import 'package:flutter_sesion_2_3/producto.dart';

class ListaCompraAddProducto extends StatefulWidget {
  final Function(Producto) crearProducto;
  final Function(Producto) editarProducto;
  final Producto? productoOriginal;
  final bool actualizando;

  const ListaCompraAddProducto({
    Key? key,
    required this.crearProducto,
    required this.editarProducto,
    this.productoOriginal,
  }) : actualizando = (productoOriginal != null),
        super(key: key);

  @override
  State<ListaCompraAddProducto> createState() => _ListaCompraAddProductoState();
}

class _ListaCompraAddProductoState extends State<ListaCompraAddProducto> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
