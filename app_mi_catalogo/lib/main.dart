import 'package:flutter/material.dart';

void main(){
  runApp( const MiApp());
}

class Producto {
  final String nombre;
  final int precio;
  final IconData icono;
  int cantidad; 

  Producto({
    required this.nombre,
    required this.precio,
    required this.icono,
    this.cantidad = 0,

  });
}

class MiApp extends StatelessWidget{
  const MiApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Mi Catálogo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: Colors.blue, useMaterial3: true),
      home: const CatalogoScreen(),
    );
  }
}

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}
class CatalogoScreenState extends State<CatalogoScreen>{
  final List<Producto> productos = [
    Producto(nombre: 'Camiseta', precio: 45000, icono: Icons.checkroom),
    Producto(nombre: 'Gorra', precio: 30000, icono: Icons.face),
    Producto(nombre: 'Audífonos', precio: 80000, icono: Icons.headphones),
    Producto(nombre: 'Lámpara', precio: 60000, icono: Icons.lightbulb),
    Producto(nombre: 'Taza', precio: 15000, icono: Icons.coffee),
  ];

  //Paso 4 Aqui
  void sumar(int index){
    setState(() {
      productos[index].cantidad++;
    });
  }

  void restar(int index){
    setState(() {
      if (productos[index].cantidad > 0){
        productos[index].cantidad--;
      }
    });
    int totalArticulos() {
      int total = 0;
      for (var p in productos){
        total = total + p.cantidad;
      }
      return total;
    }
  }


  @override
  Widget build(BuildContext context){
    //Paso 5 Aqui
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Catálogo')),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index){
          final producto = productos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Icon(producto.icono, size: 36, color: Colors.blue,),
              title: Text(producto.nombre,
                style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('\$ ${producto.precio}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => restar(index),
                  icon: const Icon(Icons.remove_circle_outline)
                  ),
                  Text('${producto.cantidad}',
                  style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                    onPressed: () => sumar(index),
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

}