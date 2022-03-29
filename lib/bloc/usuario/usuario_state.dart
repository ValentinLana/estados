part of 'usuario_cubit.dart';
// es parte del usuario_cubit.dart


//inmutable: el estado no puede ser modificado una vez creado
@immutable
abstract class UsuarioState{
}

class UsuarioInitial extends UsuarioState{
  final existeusuario = false;
}

class UsuarioActivo extends UsuarioState{
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioActivo(this.usuario);


}
