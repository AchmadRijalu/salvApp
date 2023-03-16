import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salv/models/aksi_transaksi_buyer_model.dart';
import 'package:salv/models/aksi_transaksi_seller_model.dart';
import 'package:salv/models/detail_transaksi_buyer_model.dart';
import 'package:salv/models/detail_transaksi_seller_model.dart';
import 'package:salv/models/transaksi_buyer_model.dart';
import 'package:salv/models/transaksi_seller_model.dart';
import 'package:salv/models/user_model.dart';
import 'package:salv/services/transaksi_services.dart';

// import 'package:salv/models/transaksi_model.dart';

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

      if (event is TransaksiGetAllBuyer) {
        try {
          emit(TransaksiLoading());
          final transaksi =
              await TransaksiService().getTransaksiBuyer(event.userdata!);
          emit(TransaksiBuyerGetSuccess(transaksi));
        } catch (e) {
          print(e.toString());
          emit(TransaksiFailed(e.toString()));
        }
      }
      if (event is TransaksiGetDetailSeller) {
        try {
          emit(DetailTransaksiLoading());
          final detailTransaksi = await TransaksiService()
              .getTransaksiSellerDetail(event.transaksidata);
          emit(DetailTransaksiSellerGetSuccess(detailTransaksi));
        } catch (e) {
          print(e.toString());
          emit(TransaksiFailed(e.toString()));
        }
      }
      if (event is TransaksiGetDetailBuyer) {
        try {
          emit(DetailTransaksiLoading());
          final detailTransaksi = await TransaksiService()
              .getTransaksiBuyerDetail(event.transaksidata);
          emit(DetailTransaksiBuyerGetSuccess(detailTransaksi));
        } catch (e) {
          print(e.toString());
          emit(TransaksiFailed(e.toString()));
        }
      }
      if (event is AksiTransaksiGetBuyer) {
        try {
          emit(AksiTransaksiLoading());
          final aksiTransaksi = await TransaksiService()
              .getAksiTransaksiBuyer(event.transactionId, event.status);
          emit(AksiTransaksiBuyerGetSuccess(aksiTransaksi));
        } catch (e) {
          print(e.toString());
          emit(TransaksiFailed(e.toString()));
        }
      }
      if (event is AksiTransaksiPutSeller) {
        try {
          emit(AksiTransaksiLoading());
          final aksiTransaksi = await TransaksiService()
              .putAksiTransaksiSeller(event.transactionId);
          emit(AksiTransaksiSellerPutSuccess(aksiTransaksi));
        } catch (e) {
          print(e.toString());
          emit(TransaksiFailed(e.toString()));
        }
      }
    });
  }
}
