import 'package:flutter/material.dart';
import 'package:flutter_sesion_2_3/lista_compra_pantalla_vacia.dart';
import 'package:provider/provider.dart';

import 'lista_compra.dart';


class ListaCompraPantalla extends StatelessWidget {
  const ListaCompraPantalla({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: construirPantallaListaCompra(),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget construirPantallaListaCompra() {
    return Consumer<ListaCompra>(
      builder: (context, manager, child) {
        if (manager.productos.isNotEmpty) {
          return Container( color: Colors.blueGrey, );
        } else {
          return const ListaCompraPantallaVacia();
        }
      },
    );
  }

}