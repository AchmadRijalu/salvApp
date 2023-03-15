import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salv/models/transaksi_seller_model.dart';
import 'package:salv/models/user_model.dart';
import 'package:salv/services/transaksi_services.dart';

part 'transaksi_event.dart';
part 'transaksi_state.dart';

class TransaksiBloc extends Bloc<TransaksiEvent, TransaksiState> {
  TransaksiBloc() : super(TransaksiInitial()) {
    on<TransaksiEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is TransaksiGetAllSeller) {
        try {
          emit(TransaksiLoading());
          final transaksi =
              await TransaksiService().getTransaksiSeller(event.userdata!);
          emit(TransaksiSellerGetSuccess(transaksi));
        } catch (e) {
          print(e.toString());
          emit(TransaksiFailed(e.toString()));
        }
      }

      if (event is TransaksiGetAllBuyer) {}
      if (event is TransaksiGetDetailSeller) {}
      if (event is TransaksiGetDetailBuyer) {}
    });
  }
}
