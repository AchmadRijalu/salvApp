import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../models/sign_in_form_model.dart';
import '../models/sign_up_form_model.dart';
import '../models/user_model.dart';
import '../services/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthRegister) {
        try {
          emit(AuthLoading());

          final user = await AuthService().register(event.data!);

          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthLogin) {
        try {
          emit(AuthLoading());

          final user = await AuthService().login(event.data!);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());
          final SigninFormModel? data =
              await AuthService().getCredentialFromLocal();
          final Userdata user = await AuthService().login(data!);

          emit(AuthSuccess(user));
        } catch (e) {
          print(e);
          emit(AuthFailed(e.toString()));
        }
      }
      if(event is AuthLogout){
        try{
            emit(AuthLoading());
            await AuthService().logout();

            emit(AuthInitial());
        }
        catch(e){
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
