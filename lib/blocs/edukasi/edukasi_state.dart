part of 'edukasi_bloc.dart';

abstract class EdukasiState extends Equatable {
  const EdukasiState();

  @override
  List<Object> get props => [];
}

class EdukasiInitial extends EdukasiState {}

class EdukasiSuccess extends EdukasiState {
  final Edukasi? edukasi;

  const EdukasiSuccess(this.edukasi);

  @override
  // TODO: implement props
  List<Object> get props => [edukasi!];
}

class EdukasiGetDetailSuccess extends EdukasiState {
  final EdukasiDetail? edukasiDetail;

  const EdukasiGetDetailSuccess(this.edukasiDetail);

  @override
  // TODO: implement props
  List<Object> get props => [edukasiDetail!];
}

class EdukasiLoading extends EdukasiState {}

class EdukasiFailed extends EdukasiState {
  final String e;

  const EdukasiFailed(this.e);

  @override
  // TODO: implement props
  List<Object> get props => super.props;
}
