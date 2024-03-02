part of 'marketing_bloc.dart';

sealed class MarketingState extends Equatable {
  const MarketingState();
  
  @override
  List<Object> get props => [];
}

final class MarketingInitial extends MarketingState {}

final class MarketingLoading extends MarketingState {}

final class MarketingFailed extends MarketingState {
  final String message;

  const MarketingFailed(this.message);
  @override
  List<Object> get props => [message];
}

final class MarketingLoaded extends MarketingState {
  final List<Marketing> marketings;

  const MarketingLoaded(this.marketings);

  @override
  List<Object> get props => [marketings];
}

final class MarketingAddSuccess extends MarketingState {}

final class MarketingUpdateSuccess extends MarketingState {}

final class MarketingDeleteSuccess extends MarketingState {}