import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/Features/Categories/Presentation/Bloc/Category_product/Category_product_State.dart';
import '../../../Domain/Usecase/Fetch_category_product_Usecase.dart';
import 'Category_product_Event.dart';

class CategoryProductBloc
    extends Bloc<CategoryProductEvent, CategoryProductState> {
  final FetchCategoryProductUsecase fetchCategoryProductUsecase;
  CategoryProductBloc({required this.fetchCategoryProductUsecase})
      : super(CategoryProductLoadedState(
          categoryProduct: [],
        )) {
    on<GetCategoryProductEvent>((event, emit) async {
      emit(CategoryProductLoadingState());

      final result =
          await fetchCategoryProductUsecase.call(event.categoryProductName);

      result.fold(
        (failure) => emit(CategoryProductErrorState(
            errorMessage: "${failure.message}:${failure.statusCode}")),
        (success) => emit(CategoryProductLoadedState(categoryProduct: success)),
      );
    });
  }
}
