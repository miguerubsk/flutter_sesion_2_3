import 'package:flutter/material.dart';
import 'package:flutter_sesion_2_3/Views/views.dart';

class MonsterChefPaginaPrincipal extends StatefulWidget {
  const MonsterChefPaginaPrincipal({Key? key}) : super(key: key);

  @override
  State<MonsterChefPaginaPrincipal> createState() => _MonsterChefPaginaPrincipalState();
}

class _MonsterChefPaginaPrincipalState extends State<MonsterChefPaginaPrincipal> {
  int _categoriaActiva = 0;
  static var paginas = <Widget>[
    ListaCompraPantalla(),
    RecetasPantalla(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monster Chef'),),
      body: paginas[_categoriaActiva],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _categoriaActiva,
        onTap: _alPulsar,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista compra',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Recetas',
          ),
        ],
      ),
    );
  }

  void _alPulsar(int indice) {
    setState(() => _categoriaActiva = indice);
  }
}
