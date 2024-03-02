part of 'business_bloc.dart';

sealed class BusinessState extends Equatable {
  const BusinessState();
  
  @override
  List<Object> get props => [];
}

final class BusinessInitial extends BusinessState {}


final class BusinessLoading extends BusinessState {}

final class BusinessFailed extends BusinessState {
  final String message;

  const BusinessFailed(this.message);
  @override
  List<Object> get props => [message];
}

final class BusinessLoaded extends BusinessState {
  final List<Business> business;

  const BusinessLoaded(this.business);

  @override
  List<Object> get props => [business];
}

final class BusinessAddSuccess extends BusinessState {}

final class BusinessUpdateSuccess extends BusinessState {}

final class BusinessDeleteSuccess extends BusinessState {}