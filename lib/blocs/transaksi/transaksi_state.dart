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

class TransaksiFailed extends TransaksiState {
  final String e;
  const TransaksiFailed(this.e);

  @override
  //TODO: implement props
  List<Object> get props => super.props;
}

//
