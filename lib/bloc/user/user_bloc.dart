import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<Activateuser>((event, emit) {
      emit(UserSetState(event.user));
    });

    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;

      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    on<AddProfesion>((event, emit) {
      if (!state.existUser) return;

      final profesion = state.user!.profesiones;
      profesion.add('Profesion ${profesion.length + 1}');
      emit(UserSetState(state.user!.copyWith(profesiones: profesion)));
    });

    on<DeleteUser>((event, emit) {
      emit(const UserInitialState());
    });


  }
}
