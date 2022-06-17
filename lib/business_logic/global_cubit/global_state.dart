part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class LoginLoadingState extends GlobalState {}

class LoginSuccessState extends GlobalState {
  final AccountModel accountModel;

  LoginSuccessState(this.accountModel);
}

class LoginErrorState extends GlobalState {
  final String error;
  LoginErrorState(this.error);
}

class RegisterLoadingState extends GlobalState {}

class RegisterSuccessState extends GlobalState {
  final AccountModel accountModel;

  RegisterSuccessState(this.accountModel);
}

class RegisterErrorState extends GlobalState {
  final String error;
  RegisterErrorState(this.error);
}

class AccountDataLoadingState extends GlobalState {}

class AccountDataSuccessState extends GlobalState {
  final AccountModel accountModel;

  AccountDataSuccessState(this.accountModel);
}

class AccountDataErrorState extends GlobalState {}

class ChangePasswordVisibilityState extends GlobalState {}
