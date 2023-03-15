import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salv/models/iklan_form_model.dart';
import 'package:salv/models/pembeli_iklan_model.dart';
import 'package:salv/models/user_model.dart';
import 'package:salv/services/iklan_services.dart';

import '../../models/iklan_add_model.dart';
import '../../models/iklan_buyer_detail_model.dart';
import '../../models/iklan_seller_detail_model.dart';
import '../../models/penjual_iklan_model.dart';

part 'iklan_event.dart';
part 'iklan_state.dart';

class IklanBloc extends Bloc<IklanEvent, IklanState> {
  IklanBloc() : super(IklanInitial()) {
    on<IklanEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is IklanGetAll) {
        try {
          emit(IklanLoading());

          final iklan = await IklanService().getIklanSeller();

          emit(IklanGetSuccess(iklan));
        } catch (e) {
          print(e.toString());
          emit(IklanFailed(e.toString()));
        }
      }
      if (event is IklanAddAds) {
        try {
          emit(IklanLoading());

          final tambahIklan = await IklanService().addIklanBuyer(event.data!);

          emit(IklanAddSuccess(tambahIklan));
        } catch (e) {
          emit(IklanFailed(e.toString()));
        }
      }

      if (event is IklanGetAllBuyer) {
        try {
          emit(IklanLoading());
          final iklan = await IklanService().getIklanBuyer(event.userdata!);
          emit(IklanBuyerGetSuccess(iklan));
        } catch (e) {
          emit(IklanFailed(e.toString()));
        }
      }

      if (event is IklanGetDetailBuyer) {
        try {
          emit(IklanLoading());
          final getIklan =
              await IklanService().getIklanBuyerDetail(event.adsId);
          print(getIklan.data.id);
          emit(IklanBuyerGetDetailSuccess(getIklan));
        } catch (e) {
          emit(IklanFailed(e.toString()));
        }
      }
      if (event is IklanGetDetailSeller) {
        try {
          emit(IklanLoading());

          final getIklan =
              await IklanService().getIklanSellerDetail(event.adsId);
          print(getIklan.data.id);
          emit(IklanSellerGetDetailSuccess(getIklan));
        } catch (e) {
          rethrow;
        }
      }
    });
  }
}
