part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  List<Object> get props => [];
}

class AuthRegister extends AuthEvent {
  late SignupFormModel? data;

   AuthRegister(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data!];
}

class AuthLogin extends AuthEvent {
  final SigninFormModel? data;

  const AuthLogin(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data!];
}

class AuthGetCurrentUser extends AuthEvent {}

class AuthLogout extends AuthEvent{
  
}
