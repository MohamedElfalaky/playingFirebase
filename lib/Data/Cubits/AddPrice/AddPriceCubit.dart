// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'AddPricesState.dart';

// class AddPriceCubit extends Cubit<AddPriceState> {
//   AddPriceCubit() : super(AddPriceInitial());

//   static AddPriceCubit get(context) => BlocProvider.of(context);
//   AddAdvertiseRepo AddPriceRepo = AddAdvertiseRepo();

//   void userAddPrice(
//       { Datum? model,
//         bool? isEdite,
//      required  String meterInUSD,
//      required  String meterInSP,
//       required String inUSD,
//       required String inSP,
//       required String paymentOption,
//       required String downPaymentPercentage,
//       required bool onlyAcceptUSD,
//       required bool isNegotiable,
//       required String id,
//       required String token,
//       required String category,
//       required context}) {
//     try {
//       emit(AddPriceLoading());
//       AddPriceRepo.addPrice(
//               meterInSP: meterInSP,
//               meterInUSD: meterInUSD,
//               inUSD: inUSD,
//               inSP: inSP,
//               paymentOption: paymentOption,
//               downPaymentPercentage: downPaymentPercentage,
//               onlyAcceptUSD: onlyAcceptUSD,
//               isNegotiable: isNegotiable,
//               id: id,
//               token: token)
//           .then((value) {
//         if (value != null) {
//           myApplication.navigateTo(
//               FormPage6(model: model,isEdite: isEdite,id: id, category: category), context);

//           emit(AddPriceSuccess(value));
//         } else {
//           print(value);
//           emit(AddPriceError(value.toString()));
//         }
//       });
//     } catch (e) {
//       emit(AddPriceError(e.toString()));
//     }
//   }
// }
