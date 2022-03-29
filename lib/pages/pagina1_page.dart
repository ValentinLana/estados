import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(onPressed: (){
            context.read<UsuarioCubit>().borrarusuario();
          }, icon: const Icon(Icons.exit_to_app))
        ],),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UsuarioInitial:
            return const Center(
              child: Text('No hay información del usuario'),
            );
     
          case UsuarioActivo:
            return InformacionUsuario(usuario: (state as UsuarioActivo).usuario);
      
          default:
            return const CircularProgressIndicator();
        }

         // if ( state is UsuarioInitial ) {
        //   return Center(child: Text('No hay información del usuario'));
        // } else if( state is UsuarioActivo ) {
        //   return InformacionUsuario( state.usuario );
        // } else {
        //   return Center( child: Text('Estado no reconocido '));
        // }
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'General',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(
            title: Text('nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('edad: ${usuario.edad}'),
          ),
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...usuario.profesiones!.map((e) => ListTile(title: Text(e)))
        ],
      ),
    );
  }
}
