part of 'iklan_bloc.dart';

abstract class IklanState extends Equatable {
  const IklanState();

  @override
  List<Object> get props => [];
}

class IklanInitial extends IklanState {}

//SELLER SIDE
class IklanGetSuccess extends IklanState {
  final IklanSeller? iklanSeller;

  const IklanGetSuccess(this.iklanSeller);
  List<Object> get props => [iklanSeller!];
}

class IklanSellerGetDetailSuccess extends IklanState {
  final IklanSellerDetail? iklanSellerDetail;

  const IklanSellerGetDetailSuccess(this.iklanSellerDetail);
  List<Object> get props => [iklanSellerDetail!];
}

//BUYER SIDE

class IklanBuyerGetSuccess extends IklanState {
  final IklanBuyer? iklanBuyer;
  const IklanBuyerGetSuccess(this.iklanBuyer);
  List<Object> get props => [iklanBuyer!];
}

class IklanAddSuccess extends IklanState {
  final IklanAddModel? iklanAddModel;

  const IklanAddSuccess(this.iklanAddModel);
  List<Object> get props => [iklanAddModel!];
}

class IklanBuyerGetDetailSuccess extends IklanState {
  final IklanBuyerDetail? iklanBuyerDetail;

  const IklanBuyerGetDetailSuccess(this.iklanBuyerDetail);
  List<Object> get props => [iklanBuyerDetail!];
}

class IklanCancelBuyerSuccess extends IklanState {
  final BatalIklanBuyer? batalIklanBuyer;

  const IklanCancelBuyerSuccess(this.batalIklanBuyer);
  List<Object> get props => [batalIklanBuyer!];
}

class IklanLoading extends IklanState {}

class IklanFailed extends IklanState {
  final String e;

  const IklanFailed(this.e);

  @override
  // TODO: implement props
  List<Object> get props => super.props;
}
