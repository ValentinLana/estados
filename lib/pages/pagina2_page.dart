import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_bloc.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagina 2')),
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
                  final newUser = Usuario(
                    nombre: 'Fernando',
                    edad: 35,
                    profesiones: ['FullStack Developer']
                  );
                  BlocProvider.of<UserBloc>(context, listen: false)
                      .add(Activateuser(newUser));
                }),
            MaterialButton(
                child: const Text(
                  'Cambiar edad',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  BlocProvider.of<UserBloc>(context, listen: false)
                      .add(ChangeUserAge(30));
                }),
            MaterialButton(
                child: const Text(
                  'Añadir profesión',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  BlocProvider.of<UserBloc>(context, listen: false)
                      .add(AddProfesion());
                })
          ],
        ),
      ),
    );
  }
}
