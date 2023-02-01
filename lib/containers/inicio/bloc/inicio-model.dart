class InicioModel {
  List<String>? listaItensDrawer;

  InicioModel({this.listaItensDrawer});

  InicioModel patchState(List<String>? listaItensDrawer) {
    return InicioModel(
        listaItensDrawer: listaItensDrawer ?? this.listaItensDrawer);
  }
}
