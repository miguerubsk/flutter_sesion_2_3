import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'lista_compra.dart';
import 'monster_chef_tema.dart';
import 'monster_chef_pagina_principal.dart';


class MonsterChefApp extends StatelessWidget {
  const MonsterChefApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monster Chef Application',
      theme: MonsterChefTema.claro(),
      darkTheme: MonsterChefTema.oscuro(),
      themeMode: ThemeMode.system,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider( create: (context) => ListaCompra(),),
        ],
        child: MonsterChefPaginaPrincipal(),
      ),
    );
  }
}