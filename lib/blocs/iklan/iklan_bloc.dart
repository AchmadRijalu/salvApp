import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salv/models/iklan_form_model.dart';
import 'package:salv/models/pembeli_iklan_model.dart';
import 'package:salv/models/user_model.dart';
import 'package:salv/services/iklan_services.dart';

import '../../models/iklan_add_model.dart';
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

          final iklan = await IklanService().getIklan();

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
          print("data");
          final iklan = await IklanService().getIklanBuyer(event.userdata!);
          print("ISI Data : ${iklan.data}");
          emit(IklanBuyerGetSuccess(iklan));
        } catch (e) {
          emit(IklanFailed(e.toString()));
        }
      }
    });
  }
}
