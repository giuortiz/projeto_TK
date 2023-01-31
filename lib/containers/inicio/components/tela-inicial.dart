import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/inicio-cubit.dart';
import '../bloc/inicio-model.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final InicioCubit _bloc = InicioCubit(InicioModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (contextProvider) {
        return _bloc;
      },
      child: BlocBuilder<InicioCubit, InicioModel>(
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
