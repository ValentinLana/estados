import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_bloc.dart';
import '../models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagina 1'),
      actions: [
        IconButton(onPressed: (){
          BlocProvider.of<UserBloc>(context, listen: false).add(DeleteUser());
        }, icon: Icon(Icons.delete))
      ],),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        
        return state.existUser
            ? InformacionUsuario(user: state.user!)
            : const Center(
                child: Text('No hay usuario seleccoinado'),
              );

      }),
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
  final Usuario user;
  const InformacionUsuario({
    Key? key, required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            title: Text('nombre: ${user.nombre}'),
          ),
          ListTile(
            title: Text('edad: ${user.edad}'),
          ),
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...user.profesiones.map((e) => ListTile(title: Text(e)))
        ],
      ),
    );
  }
}
