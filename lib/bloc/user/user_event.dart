part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class Activateuser extends UserEvent {
  final Usuario user;

  Activateuser(this.user);
}

class ChangeUserAge extends UserEvent {
  final int age;

  ChangeUserAge(this.age);
}

class AddProfesion extends UserEvent {
  AddProfesion();
}

class DeleteUser extends UserEvent{
}
