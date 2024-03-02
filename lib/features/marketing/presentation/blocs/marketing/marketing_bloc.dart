import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_terget_app/features/marketing/data/models/marketing_model.dart';
import 'package:my_terget_app/features/marketing/domain/entities/marketing.dart';
import 'package:my_terget_app/features/marketing/domain/usecases/delete_marketing.dart';
import 'package:my_terget_app/features/marketing/domain/usecases/get_marketing.dart';
import 'package:my_terget_app/features/marketing/domain/usecases/post_marketing.dart';
import 'package:my_terget_app/features/marketing/domain/usecases/update_marketing.dart';

part 'marketing_event.dart';
part 'marketing_state.dart';

class MarketingBloc extends Bloc<MarketingEvent, MarketingState> {
  final GetMarketing getMarketing;
  final PostMarketing postMarketing;
  final UpdateMarketing updateMarketing;
  final DeleteMarketing deleteMarketing;

  MarketingBloc(this.getMarketing, this.postMarketing, this.updateMarketing,
      this.deleteMarketing)
      : super(MarketingInitial()) {
    on<OnGetMarketing>((event, emit) async {
      emit(MarketingLoading());

      final result = await getMarketing.getMarketing();
      result.fold((l) => emit(MarketingFailed(l.message)),
          (r) => emit(MarketingLoaded(r)));
    });

    on<OnAddMarketing>((event, emit) async {
      try {
        await postMarketing.addMarketing(event.marketingModel);
        emit(MarketingAddSuccess());
      } catch (e) {
        emit(MarketingFailed(e.toString()));
      }
    });

    on<OnUpdateMarketing>((event, emit) async {
      try {
        await updateMarketing.updateMarketing(
            event.index, event.marketingModel);
        emit(MarketingUpdateSuccess());
      } catch (e) {
        emit(MarketingFailed(e.toString()));
      }
    });

    on<OnDeleteMarketing>((event, emit) async {
      try {
        await deleteMarketing.deleteMarketing(event.index);
        emit(MarketingDeleteSuccess());
      } catch (e) {
        emit(MarketingFailed(e.toString()));
      }
    });
  }
}
