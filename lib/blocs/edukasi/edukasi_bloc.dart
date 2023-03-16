import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salv/models/detail_edukasi_model.dart';
import 'package:salv/models/edukasi_model.dart';
import 'package:salv/services/edukasi_services.dart';

part 'edukasi_event.dart';
part 'edukasi_state.dart';

class EdukasiBloc extends Bloc<EdukasiEvent, EdukasiState> {
  EdukasiBloc() : super(EdukasiInitial()) {
    on<EdukasiEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is EdukasiGetAll) {
        try {
          emit(EdukasiLoading());

          final edukasiGetAll = await EdukasiService().getEdukasi();
          emit(EdukasiSuccess(edukasiGetAll));
        } catch (e) {
          emit(EdukasiFailed(e.toString()));
        }
      }

      if (event is EdukasiGetDetail) {
        try {
          emit(EdukasiLoading());
          final edukasiGetDetail = await EdukasiService().getEdukasiDetail(event.edukasiid);
          print(edukasiGetDetail);
          emit(EdukasiGetDetailSuccess(edukasiGetDetail));
        } catch (e) {
          emit(EdukasiFailed(e.toString()));
        }
      }
    });
  }
}
