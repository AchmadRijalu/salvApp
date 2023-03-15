part of 'transaksi_bloc.dart';

abstract class TransaksiEvent extends Equatable {
  const TransaksiEvent();

  @override
  List<Object> get props => [];
}

class TransaksiGetAllSeller extends TransaksiEvent {
  late String? userdata;
  TransaksiGetAllSeller(this.userdata);
  List<Object> get props => [userdata!];
}

class TransaksiGetAllBuyer extends TransaksiEvent {
  late String? userdata;
  TransaksiGetAllBuyer(this.userdata);
  List<Object> get props => [userdata!];
}

class TransaksiGetDetailSeller extends TransaksiEvent {
  late String? userdata;
  TransaksiGetDetailSeller(this.userdata);
  List<Object> get props => [userdata!];
}

class TransaksiGetDetailBuyer extends TransaksiEvent {
  late String? userdata;
  TransaksiGetDetailBuyer(this.userdata);
  List<Object> get props => [userdata!];
}
