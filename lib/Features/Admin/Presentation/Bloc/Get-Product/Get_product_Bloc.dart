  import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/Features/Admin/Domain/Entity/Admin_product_Entity.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Bloc/Get-Product/Get_product_State.dart';
import '../../../Domain/Usecase/Get_product_data.dart';
import 'Get_product_Event.dart';

// class GetProductBloc extends Bloc<GetProductEvent, GetProductState> {
//   final GetProductDataUsecase getProductDataUsecase;
//   GetProductBloc({
//     required this.getProductDataUsecase,
//   }) : super(GetProductLoadedState(productList: []));
//
//   @override
//   Stream<GetProductState> mapEventToState(GetProductEvent event) async* {
//     if (event is GetProductEvent) {
//       yield* _mapFetchProductsToState(event);
//       // yield GetProductLoadingState();
//       // final result = await getProductDataUsecase.call(
//       //   const AdminProductEntity(
//       //     productName: "productName",
//       //     description: "description",
//       //     image: [],
//       //     price: "price",
//       //     quantity: "quantity",
//       //     category: "category",
//       //   ),
//       // );
//       //
//       // result.fold(
//       //   (failure) => GetProductErrorState(
//       //       errorMessage: "${failure.message}: ${failure.statusCode}"),
//       //   (success) => GetProductLoadedState(productList: success),
//       // );
//     }
//   }
//
//   Stream<GetProductState> _mapFetchProductsToState(
//       GetProductEvent event,
//       ) async* {
//     yield GetProductLoadingState();
//     final result = await getProductDataUsecase.call(
//       const AdminProductEntity(
//         productName: "productName",
//         description: "description",
//         image: [],
//         price: "price",
//         quantity: "quantity",
//         category: "category",
//       ),
//     );
//
//     yield result.fold(
//           (failure) => GetProductErrorState(
//         errorMessage: "${failure.message}: ${failure.statusCode}",
//       ),
//           (success) => GetProductLoadedState(productList: success),
//     );
//   }
//
//   // {
//   //   on<GetProductEvent>((event, emit) async {
//   //     emit(GetProductLoadingState());
//   //     final response = await getProductDataUsecase.call(
//   //       const AdminProductEntity(
//   //         productName: "productName",
//   //         description: "description",
//   //         image: [],
//   //         price: "price",
//   //         quantity: "quantity",
//   //         category: "category",
//   //       ),
//   //     );
//   //
//   //     response.fold(
//   //         (failure) => emit(
//   //               GetProductErrorState(
//   //                   errorMessage: "${failure.message}: ${failure.statusCode}"),
//   //             ), (success) {
//   //       emit(GetProductLoadedState(productList: success));
//   //     });
//   //   });
//   // }
// }

class GetProductBloc extends Bloc<GetProductEvent, GetProductState> {
  final GetProductDataUsecase getProductDataUsecase;
  GetProductBloc({
    required this.getProductDataUsecase,
  }) : super(GetProductLoadedState(produc tList: [])) {
    on<GetProductEvent>((event, emit) async {
      emit(GetProductLoadingState());
      final response = await getProductDataUsecase.call(
        const AdminProductEntity(
          productName: "productName",
          description: "description",
          image: [],
          price: "price",
          quantity: "quantity",
          category: "category",
        ),
      );

      response.fold(
          (failure) => emit(
                GetProductErrorState(
                    errorMessage: "${failure.message}: ${failure.statusCode}"),
              ), (success) {
        emit(GetProductLoadedState(productList: success));
      });
    });
  }
}

// class GetProductBloc extends Bloc<GetProductEvent, GetProductState> {
//   final GetProductDataUsecase getProductDataUsecase;
//
//   // StreamSubscription? _productStreamSubscription;
//
//   GetProductBloc({
//     required this.getProductDataUsecase,
//   }) : super(GetProductLoadedState(productList: []));
//
//   @override
//   Stream<GetProductState> mapEventToState(GetProductEvent event) async* {
//     if (event is GetProductEvent) {
//       yield GetProductLoadingState();
//
//       final response = await getProductDataUsecase.call(
//         const AdminProductEntity(
//           productName: 'productName',
//           description: 'description',
//           image: [],
//           price: 'price',
//           quantity: 'quantity',
//           category: 'category',
//         ),
//       );
//
//       yield response.fold(
//           (failure) => GetProductErrorState(
//               errorMessage: "${failure.message}: ${failure.statusCode}"),
//           (success) =>
//         GetProductLoadedState(productList: success),
//       );
//     }
//   }
//
//   // {
//   //   on<GetProductEvent>((event, emit) async {
//   //     emit(GetProductLoadingState());
//   //     final response = await getProductDataUsecase.call(
//   //       const AdminProductEntity(
//   //         productName: "productName",
//   //         description: "description",
//   //         image: [],
//   //         price: "price",
//   //         quantity: "quantity",
//   //         category: "category",
//   //       ),
//   //     );
//   //
//   //     response.fold(
//   //         (failure) => emit(
//   //               GetProductErrorState(
//   //                   errorMessage: "${failure.message}: ${failure.statusCode}"),
//   //             ), (success) {
//   //       emit(GetProductLoadedState(productList: success));
//   //     });
//   //   });
//   // }
// }
//
