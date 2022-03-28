import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return snapshot.hasData
          // se puede usar el snapshot.data o el usuarioService.usuario
          ? Text(usuarioService.usuario.nombre)
          : Text('pagina 2');
        },
        stream: usuarioService.usuarioStream,
        )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                child: const Text(
                  'Establecer usuario',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  final nuevoUsuario = Usuario(nombre: 'Fernando', edad: 35);
                  usuarioService.cargarUsuario(nuevoUsuario);
                }),
            MaterialButton(
                child: const Text(
                  'Cambiar edad',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  usuarioService.cambiarEdad(40);
                }),
            MaterialButton(
                child: const Text(
                  'Añadir profesión',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
