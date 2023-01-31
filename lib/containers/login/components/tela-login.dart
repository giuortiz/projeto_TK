import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login-cubit.dart';
import '../bloc/login-model.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final LoginCubit _bloc = LoginCubit(LoginModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (contextProvider) {
        return _bloc;
      },
      child: BlocBuilder<LoginCubit, LoginModel>(
        builder: (context, state) {
          return Scaffold(
            body: _buildBody(context, state),
          );
        },
      ),
    ));
  }

  Widget _buildBody(BuildContext context, state) {
    return Column(
      children: [],
    );
  }
}
