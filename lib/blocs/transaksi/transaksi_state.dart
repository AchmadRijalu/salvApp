part of 'transaksi_bloc.dart';

abstract class TransaksiState extends Equatable {
  const TransaksiState();

  @override
  List<Object> get props => [];
}

class TransaksiInitial extends TransaksiState {}

class TransaksiLoading extends TransaksiState {}

class TransaksiSellerGetSuccess extends TransaksiState {
  final TransaksiSeller? transaksiSeller;
  const TransaksiSellerGetSuccess(this.transaksiSeller);
  List<Object> get props => [transaksiSeller!];
}

class TransaksiBuyerGetSuccess extends TransaksiState {
  final TransaksiBuyer? transaksiBuyer;
  const TransaksiBuyerGetSuccess(this.transaksiBuyer);
  List<Object> get props => [transaksiBuyer!];
}

class DetailTransaksiInitial extends TransaksiState {}

class DetailTransaksiLoading extends TransaksiState {}

class DetailTransaksiSellerGetSuccess extends TransaksiState {
  final DetailTransaksiSeller? detailTransaksiSeller;
  const DetailTransaksiSellerGetSuccess(this.detailTransaksiSeller);
  List<Object> get props => [detailTransaksiSeller!];
}

class DetailTransaksiBuyerGetSuccess extends TransaksiState {
  final DetailTransaksiBuyer? detailTransaksiBuyer;
  const DetailTransaksiBuyerGetSuccess(this.detailTransaksiBuyer);
  List<Object> get props => [detailTransaksiBuyer!];
}

class createTransaksiSuccess extends TransaksiState {
  final JualLimbah? jualLimbah;
  const createTransaksiSuccess(this.jualLimbah);
  List<Object> get props => [jualLimbah!];
}

class DetailTransaksiBuyerFailed extends TransaksiState {
  final String e;
  const DetailTransaksiBuyerFailed(this.e);

  @override
  //TODO: implement props
  List<Object> get props => super.props;
}

class DetailTransaksiSellerFailed extends TransaksiState {
  final String e;
  const DetailTransaksiSellerFailed(this.e);

  @override
  //TODO: implement props
  List<Object> get props => super.props;
}

class TransaksiFailed extends TransaksiState {
  final String e;
  const TransaksiFailed(this.e);

  @override
  //TODO: implement props
  List<Object> get props => super.props;
}

//
