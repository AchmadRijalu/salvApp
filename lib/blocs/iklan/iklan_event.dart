part of 'iklan_bloc.dart';

abstract class IklanEvent extends Equatable {
  const IklanEvent();

  @override
  List<Object> get props => [];
}

//SELLER SIDE
class IklanGetAll extends IklanEvent {}

class IklanGetDetailSeller extends IklanEvent {
  late String? adsId;

  IklanGetDetailSeller(this.adsId);
  List<Object> get props => [adsId!];
}

//BUYER SIDE
class IklanGetAllBuyer extends IklanEvent {
  late String? userdata;

  IklanGetAllBuyer(this.userdata);
  List<Object> get props => [userdata!];
}

class IklanGetDetailBuyer extends IklanEvent {
  late String? adsId;

  IklanGetDetailBuyer(this.adsId);
  List<Object> get props => [adsId!];
}

class IklanAddAds extends IklanEvent {
  late TambahIklanForm? data;

  IklanAddAds(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data!];
}
