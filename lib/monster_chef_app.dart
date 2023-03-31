import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sesion_2_3/Models/model.dart';
import 'package:flutter_sesion_2_3/Views/views.dart';
import 'package:flutter_sesion_2_3/Components/components.dart';


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