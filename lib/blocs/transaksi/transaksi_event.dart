part of 'transaksi_bloc.dart';

abstract class TransaksiEvent extends Equatable {
  const TransaksiEvent();

  @override
  List<Object> get props => [];
}

class AksiTransaksiGetBuyer extends TransaksiEvent {
  late String? transactionId;
  late int? status;
  AksiTransaksiGetBuyer(this.transactionId, this.status);
  List<Object> get props => [transactionId!, status!];
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
  late String? transaksidata;
  TransaksiGetDetailSeller(this.transaksidata);
  List<Object> get props => [transaksidata!];
}

class TransaksiGetDetailBuyer extends TransaksiEvent {
  late String? transaksidata;
  TransaksiGetDetailBuyer(this.transaksidata);
  List<Object> get props => [transaksidata!];
}
