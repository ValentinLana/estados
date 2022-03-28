import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

import '../models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagina 1')),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return snapshot.hasData
          // se puede usar el snapshot.data o el usuarioService.usuario
          ? InformacionUsuario(usuario: usuarioService.usuario)
          : const Center(
              child: Text('No hay información del usuario'),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario({
    Key? key, required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children:  [
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(
            title: Text('nombre: ${usuario.nombre} '),
          ),
          ListTile(
            title: Text('edad: ${usuario.edad}'),
          ),
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const ListTile(
            title: const Text('Profesion 1: '),
          ),
          const ListTile(
            title: Text('Profesion 1: '),
          ),
          const ListTile(
            title: Text('Profesion 1: '),
          ),
        ],
      ),
    );
  }
}
