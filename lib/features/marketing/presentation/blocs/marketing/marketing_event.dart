part of 'marketing_bloc.dart';

sealed class MarketingEvent extends Equatable {
  const MarketingEvent();

  @override
  List<Object> get props => [];
}

class OnGetMarketing extends MarketingEvent {
}

class OnAddMarketing extends MarketingEvent {
  final MarketingModel marketingModel;

  const OnAddMarketing(this.marketingModel);

  @override
  List<Object> get props => [marketingModel];
}

class OnUpdateMarketing extends MarketingEvent {
  final MarketingModel marketingModel;
  final int index;

  const OnUpdateMarketing(this.marketingModel, this.index);

  @override
  List<Object> get props => [MarketingModel, index];
}

class OnDeleteMarketing extends MarketingEvent {
  final int index;

  const OnDeleteMarketing(this.index);
  @override
  List<Object> get props => [index];
}