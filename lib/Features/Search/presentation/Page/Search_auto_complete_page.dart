// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../Bloc/Search_product/Search_product_Bloc.dart';
// import '../Bloc/Search_product/Search_product_State.dart';
// import '../Bloc/Search_suggestion_product/Search_suggestion_product_Bloc.dart';
// import '../Bloc/Search_suggestion_product/Search_suggestion_product_State.dart';
//
// class SearchAutoCompletePage extends StatefulWidget {
//   const SearchAutoCompletePage({super.key});
//
//   @override
//   State<SearchAutoCompletePage> createState() => _SearchAutoCompletePageState();
// }
//
// class _SearchAutoCompletePageState extends State<SearchAutoCompletePage> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SearchProductBloc, SearchProductState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return BlocBuilder<SearchSuggestionProductBloc, SearchSuggestionProductState>(
//           builder: (context, state) {
//             if(state is SearchSuggestionProductState){
//               return Center(
//                 child: CupertinoActivityIndicator(),
//               );
//             } else if(state is SearchSuggestionProductLoadedState){
//               return Autocomplete(optionsBuilder: (TextEditingValue textEditingValue) {
//                 if (textEditingValue.text.isEmpty) {
//                   return const Iterable<String>.empty();
//                 } else {
//                   return state.searchProduct.where((word) => word
//                       .toLowerCase()
//                       .contains(textEditingValue.text.toLowerCase()));
//                 }
//               },);
//               return ListView.builder(
//                 itemCount: state.searchProduct.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: Column(
//                       children: [
//                         Text("${state.searchProduct[index].productName}"),
//                         Text("${state.searchProduct[index].description}"),
//                         Text("${state.searchProduct[index].quantity}"),
//                         Text("\₹ ${state.searchProduct[index].price}"),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         );
//       },
//     );
//   }
// }
