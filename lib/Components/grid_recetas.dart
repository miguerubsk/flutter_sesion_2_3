import 'package:flutter_sesion_2_3/Models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sesion_2_3/Components/components.dart';


class GridRecetas extends StatelessWidget {
  final List<RecetaBasica> recetas;
  GridRecetas({Key? key, required this.recetas}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
            mainAxisExtent: 135,
          ),
          itemBuilder: (context, index) {
            return MiniaturaReceta(receta: recetas[index]);
          },
          itemCount: recetas.length,
        );
      },
    );
  }
}