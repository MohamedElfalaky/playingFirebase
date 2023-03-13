import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:try_firbs/helpers/dio_helper.dart';

part 'add_car_state.dart';

class AddCarCubit extends Cubit<AddCarState> {
  AddCarCubit() : super(AddCarInitial());

  addCar(
      // {int delivery = 1, int pickup = 1, String apiToken = "", status = 1}
      ) {
    emit(AddCarLoading());
    DioHelper.postData(url: "cars.json", data: {}).then((value) {
      // var myOdrersModel = OrdersModel.fromJson(value.data);
      emit(AddCarSuccess());
    }).catchError((e) {
      emit(AddCarError(err: e));
    });
  }
}
