import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salv/models/beranda_buyer_model.dart';
import 'package:salv/models/beranda_seller_model.dart';
import 'package:salv/services/beranda_services.dart';

part 'beranda_event.dart';
part 'beranda_state.dart';

class BerandaBloc extends Bloc<BerandaEvent, BerandaState> {
  BerandaBloc() : super(BerandaInitial()) {
    on<BerandaEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is BerandaGetAllSeller) {
        try {
          emit(BerandaLoading());
          final berandaSeller =
              await BerandaService().getAllBerandaSeller(event.berandaSeller!);
          emit(BerandaSellerGetSuccess(berandaSeller));
        } catch (e) {
          print(e.toString());
          emit(BerandaFailed(e.toString()));
        }
      }

      if (event is BerandaGetAllBuyer) {
        try {
          emit(BerandaLoading());
          final berandaBuyer =
              await BerandaService().getAllBerandaBuyer(event.berandaBuyer!);
          emit(BerandaBuyerGetSuccess(berandaBuyer));
        } catch (e) {
          print(e.toString());
          emit(BerandaFailed(e.toString()));
        }
      }
    });
  }
}
