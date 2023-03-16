part of 'beranda_bloc.dart';

abstract class BerandaEvent extends Equatable {
  const BerandaEvent();

  @override
  List<Object> get props => [];
}

class BerandaGetAllSeller extends BerandaEvent {
  late String? berandaSeller;
  BerandaGetAllSeller(this.berandaSeller);
  List<Object> get props => [berandaSeller!];
}
