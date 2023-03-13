part of 'edukasi_bloc.dart';

abstract class EdukasiEvent extends Equatable {
  const EdukasiEvent();

  @override
  List<Object> get props => [];
  
}

class EdukasiGetAll extends EdukasiEvent{
  
}
