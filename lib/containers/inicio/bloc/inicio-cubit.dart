import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/webview.dart';
import 'inicio-model.dart';

class InicioCubit extends Cubit<InicioModel> {
  InicioCubit(super.initialState);

  Future<void> openMenu(BuildContext context) async {
    if (kIsWeb) {
      if (!await launchUrl(Uri.parse("https://www.google.com"))) {
        throw Exception('Could not launch https://www.google.com');
      }
    } else {
      emit(state.patchState(urlLaunch: "https://www.google.com"));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebView(
                    bloc: this,
                  )));
    }
  }
}
