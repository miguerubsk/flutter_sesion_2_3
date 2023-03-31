import 'package:flutter/material.dart';
import 'package:flutter_sesion_2_3/Models/model.dart';
import 'package:uuid/uuid.dart';

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

  final _controladorNombre = TextEditingController();
  String _nombre = '';
  Importancia _importancia = Importancia.baja;
  int _valorActualSlider = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton( icon: const Icon(Icons.check), onPressed: () {
            final producto = Producto(
              id: widget.productoOriginal?.id ?? const Uuid().v1(),
              nombre: _controladorNombre.text,
              importancia: _importancia,
              cantidad: _valorActualSlider,
            );
            if (widget.actualizando) {
              widget.editarProducto(producto);
            } else {
              widget.crearProducto(producto);
            }
          },),
        ],
        elevation: 0.0,
        title: const Text('Añadir/Editar'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: <Widget>[
          construyeCampoNombre(),
          const SizedBox(height: 14,),
          construyeCampoImportancia(),
          const SizedBox(height: 8,),
          construyeCampoCantidad(),
        ],),
      ),
    );
  }

  @override
  void dispose() {
    _controladorNombre.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final productoOriginal = widget.productoOriginal;
    if (productoOriginal != null) {
      _controladorNombre.text = productoOriginal.nombre;
      _nombre = productoOriginal.nombre;
      _valorActualSlider = productoOriginal.cantidad;
      _importancia = productoOriginal.importancia;
    }
    _controladorNombre.addListener(() {_nombre = _controladorNombre.text;});
  }

  Widget construyeCampoNombre(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nombre del producto:', style: Theme.of(context).textTheme.titleSmall,),
        TextField(controller: _controladorNombre, decoration: const InputDecoration(hintText: 'P.e.: Pan, 1kg de sal, etc.'),),
      ],
    );
  }

  Widget construyeCampoImportancia() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Importancia', style: Theme.of(context).textTheme.titleSmall,),
        Wrap(
          spacing: 10.0,
          children: Importancia.values.map(
              (elemento) {
                return ChoiceChip(
                  selectedColor: Colors.black,
                  selected: _importancia == elemento,
                  label: Text(
                    elemento.nombre,
                    style: const TextStyle(color: Colors.white),
                  ),
                  onSelected: (selection){
                    setState(() { _importancia = elemento; });
                  },
                );
              }
          ).toList(),
        ),
      ],
    );
  }

  Widget construyeCampoCantidad() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
    Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
      Text(
      'Cantidad',
      style: Theme.of(context).textTheme.titleSmall,
    ),
        const SizedBox(width: 16.0),
        Text(
          _valorActualSlider.toInt().toString(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    ),
        Slider(
          value: _valorActualSlider.toDouble(),
          min: 0.0,
          max: 100.0,
          divisions: 100,
          label: _valorActualSlider.toInt().toString(),
          onChanged: (double value) {
            setState( () { _valorActualSlider = value.toInt(); },);
          },
        ),
      ],
    );
  }

}
