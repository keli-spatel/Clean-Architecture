
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/Features/Admin/Domain/Entity/Admin_product_Entity.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Bloc/Add-Product/Admin_product_Event.dart';
import '../../../Domain/Usecase/Sell_product_Usecase.dart';
import 'Admin_product_State.dart';

class AdminProductBloc extends Bloc<AdminProductEvent, AdminProductState> {
  final SellProductUsecase sellProductUsecase;

  AdminProductBloc({
    required this.sellProductUsecase,
  }) : super(AdminProductLoadedState()) {
    on<AddAdminProductEvent>((event, emit) async {
      emit(AdminProductLoadingState());
      final result = await sellProductUsecase.call(AdminProductEntity(
        productName: event.productName,
        description: event.description,
        image: event.image,
        category: event.category,
        price: event.price,
        quantity: event.quantity,
      ));

      result.fold(
        (failure) => emit(
          AdminProductErrorState(
            errorMessage: "${failure.message}:${failure.statusCode}",
          ),
        ),
        (success) => emit(
          AdminProductLoadedState(),
        ),
      );
    });
  }
}
