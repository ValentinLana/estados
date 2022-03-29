

import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/usuario.dart';


part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState>{
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user){
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad){
    final currentState = state;
    if (currentState is UsuarioActivo){
      final newUser = currentState.usuario.copyWith(edad: 30);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion(){
    final currentState = state;
    if (currentState is UsuarioActivo){
      final profesion = currentState.usuario.profesiones;
      profesion!.add('Nueva profesion número ${profesion.length + 1}');
      final newUser = currentState.usuario.copyWith(profesiones: profesion);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarusuario(){
    emit(UsuarioInitial());
  }

}