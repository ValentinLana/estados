part of 'user_bloc.dart';

@immutable
abstract class UserState {
  //abstract no se pueden crear instancias
  //immutable no pueden cambiar las prop
  final bool existUser;
  final Usuario? user;

  const UserState({this.existUser = false, this.user});
}

class UserInitialState extends UserState {
  const UserInitialState() : super(existUser: false, user: null);
}

class UserSetState extends UserState {
  final Usuario newUser;

  const UserSetState(this.newUser) : super(existUser: true, user: newUser);
}
