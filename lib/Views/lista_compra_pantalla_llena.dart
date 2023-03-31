import 'package:flutter/material.dart';
import 'package:flutter_sesion_2_3/Models/model.dart';
import 'package:flutter_sesion_2_3/Components/linea_producto.dart';
import 'package:flutter_sesion_2_3/Views/views.dart';


class ListaCompraPantallaLlena extends StatelessWidget {
  const ListaCompraPantallaLlena({Key? key, required this.listaCompra}) : super(key: key);

  final ListaCompra listaCompra;

  @override
  Widget build(BuildContext context) {
    final productos = listaCompra.productos;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
        itemCount: productos.length,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 8.0);
        },
        itemBuilder: (context, index) {
          final producto = productos[index];
          return Dismissible(
            key: Key(producto.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                  size: 35.0
              ),
            ),
            onDismissed: (direction) {
              listaCompra.removeProductoAt(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${producto.nombre} borrado'),
                ),
              );
            },
            child: InkWell(
              key: Key(producto.id),
              child: LineaProducto(
                producto: producto,
                completar: (valor) {
                  if (valor != null) {
                    listaCompra.marcaCompletado(index, valor);
                  }
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaCompraAddProducto(
                      productoOriginal: producto,
                      editarProducto: (producto) {
                        listaCompra.updateProducto(producto, index);
                        Navigator.pop(context);
                      },
                      crearProducto: (producto) {},
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
