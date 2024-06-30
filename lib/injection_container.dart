import 'package:e_commerce_app/Features/Admin/Data/Data_source/Remote_data_source/Admin_product_Remote_data_source.dart';
import 'package:e_commerce_app/Features/Admin/Data/Data_source/Remote_data_source/Admin_product_Remote_data_source_impl.dart';
import 'package:e_commerce_app/Features/Admin/Data/Repository/Admin_product_repository_impl.dart';
import 'package:e_commerce_app/Features/Admin/Domain/Repository/Admin_product_repository.dart';
import 'package:e_commerce_app/Features/Admin/Domain/Usecase/Get_product_data.dart';
import 'package:e_commerce_app/Features/Admin/Domain/Usecase/Sell_product_Usecase.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Bloc/Add-Product/Admin_product_Bloc.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Bloc/Get-Product/Get_product_Bloc.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Bloc/Pick-Image/Pick_image_Bloc.dart';
import 'package:e_commerce_app/Features/Authentication/Data/Data_source/Remote_data_source/User_remote_data_source.dart';
import 'package:e_commerce_app/Features/Authentication/Data/Data_source/Remote_data_source/User_remote_data_source_impl.dart';
import 'package:e_commerce_app/Features/Authentication/Data/Repository/User_repository_impl.dart';
import 'package:e_commerce_app/Features/Authentication/Domain/Repository/User_Repository.dart';
import 'package:e_commerce_app/Features/Authentication/Domain/Usecase/Get_user_data_Usecase.dart';
import 'package:e_commerce_app/Features/Authentication/Domain/Usecase/Is_logged_in_user_Usecase.dart';
import 'package:e_commerce_app/Features/Authentication/Domain/Usecase/Sign_in_user_Usecase.dart';
import 'package:e_commerce_app/Features/Authentication/Domain/Usecase/Sign_up_user_Usecase.dart';
import 'package:e_commerce_app/Features/Authentication/Presentation/Bloc/Auth/Auth_Bloc.dart';
import 'package:e_commerce_app/Features/Categories/Data/Data_source/Remote_data_source/Category_product_remote_data_source.dart';
import 'package:e_commerce_app/Features/Categories/Data/Data_source/Remote_data_source/Category_product_remote_data_source_Impl.dart';
import 'package:e_commerce_app/Features/Categories/Data/Repository/Category_product_repository_Impl.dart';
import 'package:e_commerce_app/Features/Categories/Domain/Repository/Category_product_Repository.dart';
import 'package:e_commerce_app/Features/Categories/Domain/Usecase/Fetch_category_product_Usecase.dart';
import 'package:e_commerce_app/Features/Categories/Presentation/Bloc/Category_product/Category_product_Bloc.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Bloc/Bottom_Bar/Bottom_Bar_Bloc.dart';
import 'package:e_commerce_app/Features/Profile/Data/Data_source/Remote_data_source/Profile_user_remote_data_source.dart';
import 'package:e_commerce_app/Features/Profile/Data/Data_source/Remote_data_source/Profile_user_remote_data_source_Impl.dart';
import 'package:e_commerce_app/Features/Profile/Data/Repository/Profile_user_repository_Impl.dart';
import 'package:e_commerce_app/Features/Profile/Domain/Repository/Profile_user_Repository.dart';
import 'package:e_commerce_app/Features/Profile/Domain/Usecase/Get_single_user_data_Usecase.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Bloc/Service_visibility/Service_visibility_Bloc.dart';
import 'package:e_commerce_app/Features/Search/Data/Data_source/Remote_data_source/Search_product_Remote_data_source.dart';
import 'package:e_commerce_app/Features/Search/Data/Data_source/Remote_data_source/Search_product_Remote_data_source_Impl.dart';
import 'package:e_commerce_app/Features/Search/Data/Repository/Search_product_repository_Impl.dart';
import 'package:e_commerce_app/Features/Search/Domain/Repository/Search_product_Repository.dart';
import 'package:e_commerce_app/Features/Search/Domain/Usecase/Get_search_product_Usecase.dart';
import 'package:e_commerce_app/Features/Search/presentation/Bloc/Search_product/Search_product_Bloc.dart';
import 'package:get_it/get_it.dart';
import 'Features/Profile/Presentation/Bloc/Profile/Profile_Bloc.dart';
import 'Features/Search/Domain/Usecase/Get_search_product_suggestion_Usecase.dart';
import 'Features/Search/presentation/Bloc/Search_suggestion_product/Search_suggestion_product_Bloc.dart';

final sl = GetIt.instance;

// void setupLocator() => sl.init(environment: kIsWeb ? 'web' : 'mobile');

Future<void> init() async {
  // Bloc >>>
  // Authentication
  sl.registerFactory(
    () => AuthBloc(
      signUpUserUsecase: sl.call(),
      signInUserUsecase: sl.call(),
      isLoggedInUserUsecase: sl.call(),
      getUserData: sl.call(),
    ),
  );

  // Home
  sl.registerFactory(() => BottomBarBloc());

  // Profile
  sl.registerFactory(() => ServiceVisibilityBloc());
  sl.registerFactory(
    () => ProfileBloc(
      getSingleUserDataUsecase: sl.call(),
    ),
  );

  // Search
  sl.registerFactory(
    () => SearchProductBloc(
      getSearchProductUsecase: sl.call(),
    ),
  );
  sl.registerFactory(
    () => SearchSuggestionProductBloc(
      getSearchSuggestionProductUsecase: sl.call(),
    ),
  );

  // Category
  sl.registerFactory(
    () => CategoryProductBloc(
      fetchCategoryProductUsecase: sl.call(),
    ),
  );

  // Admin Product
  sl.registerFactory(
    () => AdminProductBloc(
      sellProductUsecase: sl.call(),
    ),
  );

  // image picker
  sl.registerFactory(() => ImagePickerBloc());

  // Get product
  sl.registerFactory(
    () => GetProductBloc(
      getProductDataUsecase: sl.call(),
    ),
  );

  // Usecase >>>
  // Authentication
  sl.registerLazySingleton(
    () => SignUpUserUsecase(
      userRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => SignInUserUsecase(
      userRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton(
      () => IsLoggedInUserUsecase(userRepository: sl.call()));
  sl.registerLazySingleton(
    () => GetUserDataUsecase(
      userRepository: sl.call(),
    ),
  );

  // Profile
  sl.registerLazySingleton(
    () => GetSingleUserDataUsecase(
      profileUserRepository: sl.call(),
    ),
  );

  // Search
  sl.registerLazySingleton(
    () => GetSearchProductUsecase(
      searchProductRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => GetSearchSuggestionProductUsecase(
      searchProductRepository: sl.call(),
    ),
  );

  // Category
  sl.registerLazySingleton(
    () => FetchCategoryProductUsecase(
      categoryProductRepository: sl.call(),
    ),
  );

  // Admin product
  sl.registerLazySingleton(
    () => SellProductUsecase(
      adminProductRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => GetProductDataUsecase(
      adminProductRepository: sl.call(),
    ),
  );

  // Repository >>>
  // Authentication
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userRemoteDataSource: sl.call()),
  );

  // Profile
  sl.registerLazySingleton<ProfileUserRepository>(
    () => ProfileUserRepositoryImpl(
      profileUserRemoteDataSource: sl.call(),
    ),
  );

  // Search
  sl.registerLazySingleton<SearchProductRepository>(
    () => SearchProductRepositoryImpl(
      searchProductRemoteDataSource: sl.call(),
    ),
  );

  // Category
  sl.registerLazySingleton<CategoryProductRepository>(
    () => CategoryProductRepositoryImpl(
      categoryProductRemoteDataSource: sl.call(),
    ),
  );

  // Admin Product
  sl.registerLazySingleton<AdminProductRepository>(
    () => AdminProductRepositoryImpl(
      adminProductRemoteDataSource: sl.call(),
    ),
  );

  // RemoteData Source >>>
  // Authentication
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );

  // Profile
  sl.registerLazySingleton<ProfileUserRemoteDataSource>(
      () => ProfileUserRemoteDataSourceImpl());

  // Search
  sl.registerLazySingleton<SearchProductRemoteDataSource>(
      () => SearchProductRemoteDataSourceImpl());

  // Category
  sl.registerLazySingleton<CategoryProductRemoteDataSource>(
    () => CategoryProductRemoteDataSourceImpl(),
  );

  // Admin Product
  sl.registerLazySingleton<AdminProductRemoteDataSource>(
    () => AdminProductRemoteDataSourceImpl(),
  );
}
