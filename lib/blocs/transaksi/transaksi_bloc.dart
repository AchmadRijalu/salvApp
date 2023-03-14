import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaksi_event.dart';
part 'transaksi_state.dart';

class TransaksiBloc extends Bloc<TransaksiEvent, TransaksiState> {
  TransaksiBloc() : super(TransaksiInitial()) {
    on<TransaksiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
