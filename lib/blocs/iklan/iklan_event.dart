part of 'iklan_bloc.dart';

abstract class IklanEvent extends Equatable {
  const IklanEvent();

  @override
  List<Object> get props => [];
}

class IklanGetAll extends IklanEvent {}
