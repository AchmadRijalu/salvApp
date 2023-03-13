part of 'iklan_bloc.dart';

abstract class IklanState extends Equatable {
  const IklanState();

  @override
  List<Object> get props => [];
}

class IklanInitial extends IklanState {}

class IklanGetSuccess extends IklanState {
  final IklanSeller? iklanSeller;

  const IklanGetSuccess(this.iklanSeller);
  List<Object> get props => [iklanSeller!];
}

class IklanLoading extends IklanState {}

class IklanFailed extends IklanState {
  final String e;

  const IklanFailed(this.e);

  @override
  // TODO: implement props
  List<Object> get props => super.props;
}
