import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_terget_app/features/business/data/models/business_model.dart';
import 'package:my_terget_app/features/business/domain/entities/business.dart';
import 'package:my_terget_app/features/business/domain/usecases/delete_business.dart';
import 'package:my_terget_app/features/business/domain/usecases/get_business.dart';
import 'package:my_terget_app/features/business/domain/usecases/post_business.dart';
import 'package:my_terget_app/features/business/domain/usecases/update_business.dart';

part 'business_event.dart';
part 'business_state.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  final GetBusiness getBusiness;
  final PostBusiness postBusiness;
  final UpdateBusiness updateBusiness;
  final DeleteBusiness deleteBusiness;
  
  BusinessBloc(this.getBusiness, this.postBusiness, this.updateBusiness, this.deleteBusiness) : super(BusinessInitial()) {
    on<OnGetBusiness>((event, emit) async {
      emit(BusinessLoading());

      final result = await getBusiness.getBusiness();
      result.fold(
          (l) => emit(BusinessFailed(l.message)), (r) => emit(BusinessLoaded(r)));
    });

    on<OnAddBusiness>((event, emit) async {
      try {
        await postBusiness.addBusiness(event.businessModel);
        emit(BusinessAddSuccess());
      } catch (e){
        emit(BusinessFailed(e.toString()));
      }
    });

    on<OnUpdateBusiness>((event, emit) async {
      try {
        await updateBusiness.updateBusiness(event.index, event.businessModel);
        emit(BusinessUpdateSuccess());
      } catch (e){
        emit(BusinessFailed(e.toString()));
      }
      
    });

    on<OnDeleteBusiness>((event, emit) async {
      try {
        await deleteBusiness.deleteBusiness(event.index);
        emit(BusinessDeleteSuccess());
      } catch (e){
        emit(BusinessFailed(e.toString()));
      }
      
    });
  }
}
