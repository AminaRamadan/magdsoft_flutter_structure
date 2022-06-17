import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  AccountModel? accountModel ;

  void UserLogin({
    required String email,
    required String password,
  }){
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      body: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      accountModel = AccountModel.fromJson(value.data);
      emit(LoginSuccessState(accountModel!));
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });
  }


  void UserRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }){
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      body: {
        'name': name,
        'email': email,
        'phone' : phone,
        'password': password,
        'confirmPassword' : confirmPassword,
      },
    ).then((value) {

      accountModel = AccountModel.fromJson(value.data);
      emit(RegisterSuccessState(accountModel!));
    }).catchError((error){
      emit(RegisterErrorState(error.toString()));
    });
  }



  void getUserData() {
    emit(AccountDataLoadingState());

    DioHelper.getData(
      url: USERDATA,

    ).then((value) {
      accountModel = AccountModel.fromJson(value.data);

      emit(AccountDataSuccessState(accountModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AccountDataErrorState());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(ChangePasswordVisibilityState());
  }

}