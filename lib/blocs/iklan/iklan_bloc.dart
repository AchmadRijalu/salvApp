import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salv/services/iklan_services.dart';

import '../../models/penjual_iklan_model.dart';

part 'iklan_event.dart';
part 'iklan_state.dart';

class IklanBloc extends Bloc<IklanEvent, IklanState> {
  IklanBloc() : super(IklanInitial()) {
    on<IklanEvent>((event, emit) async{
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
    });
  }
}
