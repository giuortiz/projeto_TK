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
  final InicioCubit _bloc = InicioCubit(InicioModel(listaItensDrawer: [
    "Home/Seguro",
    "Minhas Contratações",
    "Meus Sinistros",
    "Minha Familia",
    "Meus Bens",
    "Pagamentos",
    "Corretores",
    "Validar Boleto",
    "Telefones Importantes",
    "Configurações"
  ]));

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
            backgroundColor: const Color(0xff292929),
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: const Color(0xff292929),
              title: Image.asset("assets/logo-tokio-marine-seguradora-256.png",
                  color: Colors.white, fit: BoxFit.cover),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notification_add_rounded))
              ],
            ),
            body: _buildBody(context, state),
            drawer: _buildDrawer(),
          );
        },
      ),
    ));
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xff292929),
      child: ListView(children: [
        Container(
          margin: const EdgeInsets.only(top: 16, left: 16),
          child: const Text(
            "Olá!",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16, left: 16),
          child: Row(children: [
            Container(
                margin: const EdgeInsets.only(right: 4),
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "CAIO MAXIMO",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Text(
                      "Minha conta",
                      style: TextStyle(color: Color(0xff2bbab4)),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                )
              ],
            )
          ]),
        ),
        Column(
          children: _buildListDrawerItens(),
        ),
        const ListTile(
            leading: Text(
          "Sair",
          style: TextStyle(color: Color(0xff2bbab4)),
        )),
      ]),
    );
  }

  List<Widget> _buildListDrawerItens() {
    List<Widget> lista = [];
    _bloc.state.listaItensDrawer!.forEach((element) {
      lista.add(ListTile(
        leading: const Icon(Icons.settings, color: Color(0xff2bbab4)),
        title: Text(
          element,
          style: const TextStyle(color: Colors.white),
        ),
      ));
    });
    return lista;
  }

  Widget _buildBody(BuildContext context, state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
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
            margin: const EdgeInsets.only(left: 32, top: 32, bottom: 8),
            child: const Text("Cotar e Contratar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
              margin: const EdgeInsets.only(left: 32),
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCardMenu(Icons.car_rental, "Automóvel"),
                  _buildCardMenu(Icons.house, "Residência"),
                  _buildCardMenu(Icons.monitor_heart_sharp, "Vida"),
                  _buildCardMenu(Icons.accessible, "Acidentes Pessoais"),
                  _buildCardMenu(Icons.motorcycle, "Moto"),
                  _buildCardMenu(Icons.business, "Empresa"),
                ],
              )),
          _buildArea("Minha Familia",
              "Adicione aqui membros da sua família e compartilhe os seguros com eles."),
          _buildArea("Contratados", "Você ainda não possui seguros contratados")
        ],
      ),
    );
  }

  Widget _buildCardMenu(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      width: 80,
      height: 80,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xff4e4e4e),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(0xff2bbab4),
              size: 40,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            )
          ]),
    );
  }

  Widget _buildArea(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 32, top: 32, bottom: 8),
          child: Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 32, left: 32),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: const Color(0xff4e4e4e),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.add_circle_outline_rounded,
                color: Colors.white, size: 40),
            Container(
              margin: const EdgeInsets.only(top: 32, left: 16, right: 16),
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            )
          ]),
        )
      ],
    );
  }
}
