import 'package:flutter/material.dart';
import 'package:flutter_sesion_2_3/Components/components.dart';
import 'package:flutter_sesion_2_3/Models/model.dart';


class RecetasPantalla extends StatelessWidget {

  final ServicioRecetasHttp servicioRecetas = ServicioRecetasHttp();

  RecetasPantalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: servicioRecetas.getRecetas(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('No se puede conectar con el servidor'),
            );
          } else {
            return Center(
                child: GridRecetas(recetas: snapshot.data,),
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}