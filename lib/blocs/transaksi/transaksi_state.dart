part of 'transaksi_bloc.dart';

abstract class TransaksiState extends Equatable {
  const TransaksiState();
  
  @override
  List<Object> get props => [];
}

class TransaksiInitial extends TransaksiState {}
