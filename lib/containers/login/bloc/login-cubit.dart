import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_tokio_marine/api/Tokio-marine/i-tokio-marine-service.dart';
import 'package:projeto_tokio_marine/api/Tokio-marine/tokio-marine-service.dart';
import 'login-model.dart';

class LoginCubit extends Cubit<LoginModel> {
  LoginCubit(super.initialState);

  ITokioMarineService? _service;

  Future<void> authenticate(String email, String senha) async {
    _service = TokioMarineService();
    var res = await _service!.Authentication(email, senha);
  }
}
