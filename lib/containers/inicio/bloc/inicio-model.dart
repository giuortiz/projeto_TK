class InicioModel {
  List<String>? listaItensDrawer;
  String? urlLaunch;

  InicioModel({this.listaItensDrawer, this.urlLaunch});

  InicioModel patchState({List<String>? listaItensDrawer, String? urlLaunch}) {
    return InicioModel(
        listaItensDrawer: listaItensDrawer ?? this.listaItensDrawer,
        urlLaunch: urlLaunch ?? this.urlLaunch);
  }
}
