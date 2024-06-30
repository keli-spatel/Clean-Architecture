import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/Features/Search/presentation/Bloc/Search_product/Search_product_Event.dart';
import 'package:e_commerce_app/Features/Search/presentation/Bloc/Search_product/Search_product_State.dart';

import '../../../Domain/Usecase/Get_search_product_Usecase.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  final GetSearchProductUsecase getSearchProductUsecase;

  SearchProductBloc({required this.getSearchProductUsecase})
      : super(SearchProductLoadedState(searchProduct: [])) {
    on<GetSearchProductEvent>((event, emit) async {
      emit(SearchProductLoadingState());

      final result = await getSearchProductUsecase.call(event.productName);

      result.fold(
        (failure) => emit(
          SearchProductErrorState(
            errorMessage: "${failure.message}: ${failure.statusCode}",
          ),
        ),
        (success) => emit(
          SearchProductLoadedState(
            searchProduct: success,
          ),
        ),
      );
    });
  }
}
