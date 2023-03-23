import 'package:flutter/widgets.dart';
import 'package:flutter_sesion_2_3/producto.dart';

class ListaCompra extends ChangeNotifier{
  final _productos = <Producto>[];
  List<Producto> get productos => List.unmodifiable(_productos);

  Producto removeProductoAt(int index){
    Producto removed = _productos.removeAt(index);
    notifyListeners();
    return removed;
  }

  void addProducto(Producto item){
    _productos.add(item);
    notifyListeners();
  }

  void updateProducto(Producto item, int index){
    _productos[index] = item;
    notifyListeners();
  }

  void marcaCompletado(int index){
    final producto = _productos[index];
    updateProducto(producto.copiaSiNulo(completado: true), index);
    notifyListeners();
  }

}