part of 'transaksi_bloc.dart';

abstract class TransaksiState extends Equatable {
  const TransaksiState();

  @override
  List<Object> get props => [];
}

class TransaksiInitial extends TransaksiState {}

class TransaksiLoading extends TransaksiState {}

class TransaksiGetSuccess extends TransaksiState {
  final Transaksi? transaksi;
  const TransaksiGetSuccess(this.transaksi);
  List<Object> get props => [transaksi!];
}

class TransaksiFailed extends TransaksiState {
  final String e;
  const TransaksiFailed(this.e);

  @override
  //TODO: implement props
  List<Object> get props => super.props;
}

//
