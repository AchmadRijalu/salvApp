part of 'beranda_bloc.dart';

abstract class BerandaState extends Equatable {
  const BerandaState();

  @override
  List<Object> get props => [];
}

class BerandaInitial extends BerandaState {}

class BerandaLoading extends BerandaState {}

class BerandaSellerGetSuccess extends BerandaState {
  final BerandaSeller? berandaSeller;
  const BerandaSellerGetSuccess(this.berandaSeller);
  List<Object> get props => [berandaSeller!];
}

class BerandaBuyerGetSuccess extends BerandaState {
  final BerandaBuyer? berandaBuyer;
  const BerandaBuyerGetSuccess(this.berandaBuyer);
  List<Object> get props => [berandaBuyer!];
}

class BerandaFailed extends BerandaState {
  final String e;
  const BerandaFailed(this.e);

  @override
  //TODO: implement props
  List<Object> get props => super.props;
}
