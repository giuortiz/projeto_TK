import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login-cubit.dart';
import '../bloc/login-model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final LoginCubit _bloc = LoginCubit(LoginModel());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
    );
  }

  Widget _buildBody(BuildContext context, state) {
    return Stack(
      children: [
        Column(children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff2bbab4),
                Colors.yellow,
              ],
            )),
          ),
          Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              color: const Color(0xff292929)),
        ]),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 32),
                  child: Image.asset(
                      "assets/logo-tokio-marine-seguradora-256.png",
                      width: (kIsWeb) ? 200 : 100,
                      color: Colors.white,
                      fit: BoxFit.cover),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 32, bottom: 16),
                  child: const Text(
                    "Bem vindo!",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 32, right: 32),
                  child: const Text(
                    "Aqui você gerencia seus seguros e de seus familiares em poucos cliques!",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                _buildLoginCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginCard() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: (kIsWeb) ? 300 : null,
          margin: const EdgeInsets.all(32),
          child: Material(
            borderRadius: BorderRadius.circular(6),
            elevation: 4,
            color: const Color(0xff292929),
            child: Container(
              padding: const EdgeInsets.all(28),
              child: Column(
                children: [
                  Container(
                      child: Row(
                    children: [
                      Container(
                        child: const Text("Entrar",
                            style: TextStyle(
                                color: Color(0xff2bbab4),
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 32),
                        child: const Text("Cadastrar",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          hintStyle: const TextStyle(color: Colors.white),
                          hintText: "Email",
                          fillColor: const Color(0xff292929)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: TextField(
                      controller: _senhaController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          hintStyle: const TextStyle(color: Colors.white),
                          hintText: "Senha",
                          fillColor: const Color(0xff292929)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Radio(
                          value: true,
                          groupValue: [],
                          onChanged: (value) {},
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 2),
                          child: const Text(
                            "Lembrar senha",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ]),
                      const Text(
                        "Esqueci minha senha",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff2bbab4),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff292929),
          ),
          padding: const EdgeInsets.all(8),
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff2bbab4),
                    Colors.yellow,
                  ],
                )),
            child: FloatingActionButton(
              onPressed: () {
                _bloc.authenticate(
                    _emailController.text, _senhaController.text);
              },
              child: const Icon(
                Icons.arrow_forward_sharp,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        )
      ],
    );
  }
}
