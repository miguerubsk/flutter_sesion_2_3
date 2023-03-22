import 'package:flutter/material.dart';
import 'package:flutter_sesion_2_3/lista_compra_pantalla_vacia.dart';


class ListaCompraPantalla extends StatelessWidget {
  const ListaCompraPantalla({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ListaCompraPantallaVacia(),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}