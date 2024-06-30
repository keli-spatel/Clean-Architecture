import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/Features/Search/presentation/Bloc/Search_suggestion_product/Search_suggestion_product_Event.dart';
import 'package:e_commerce_app/Features/Search/presentation/Bloc/Search_suggestion_product/Search_suggestion_product_State.dart';

import '../../../Domain/Usecase/Get_search_product_suggestion_Usecase.dart';

class SearchSuggestionProductBloc
    extends Bloc<SearchSuggestionProductEvent, SearchSuggestionProductState> {
  final GetSearchSuggestionProductUsecase getSearchSuggestionProductUsecase;

  SearchSuggestionProductBloc({required this.getSearchSuggestionProductUsecase})
      : super(
          SearchSuggestionProductLoadedState(searchProduct: []),
        ) {
    on<GetSearchSuggestionProductEvent>((event, emit) async {
      emit(SearchSuggestionProductLoadingState());

      final result = await getSearchSuggestionProductUsecase
          .call(event.productSuggestedName);

      result.fold(
        (failure) => emit(
          SearchSuggestionProductErrorState(
            errorMessage: "${failure.message}: ${failure.statusCode}",
          ),
        ),
        (success) => emit(
          SearchSuggestionProductLoadedState(
            searchProduct: success,
          ),
        ),
      );
    });
  }
}
