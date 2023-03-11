part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailed extends AuthState {
  final String e;

  const AuthFailed(this.e);

  @override
  // TODO: implement props
  List<Object> get props => super.props;
}

class AuthCheckEmailSuccess extends AuthState {}

class AuthSuccess extends AuthState {
  final Userdata? user;

  const AuthSuccess(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user!];
}
