part of 'business_bloc.dart';

sealed class BusinessEvent extends Equatable {
  const BusinessEvent();

  @override
  List<Object> get props => [];
}


class OnGetBusiness extends BusinessEvent {
}

class OnAddBusiness extends BusinessEvent {
  final BusinessModel businessModel;

  const OnAddBusiness(this.businessModel);

  @override
  List<Object> get props => [businessModel];
}

class OnUpdateBusiness extends BusinessEvent {
  final BusinessModel businessModel;
  final int index;

  const OnUpdateBusiness(this.businessModel, this.index);

  @override
  List<Object> get props => [businessModel, index];
}

class OnDeleteBusiness extends BusinessEvent {
  final int index;

  const OnDeleteBusiness(this.index);
  @override
  List<Object> get props => [index];
}
