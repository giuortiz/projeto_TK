import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../bloc/inicio-cubit.dart';

class WebView extends StatefulWidget {
  InicioCubit? bloc;

  WebView({this.bloc});

  @override
  WebViewState createState() => WebViewState();
}

class WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc!,
      child: WebviewScaffold(
        displayZoomControls: true,
        withZoom: true,
        url: widget.bloc!.state.urlLaunch!,
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.bloc!.state.urlLaunch!),
        ),
      ),
    );
  }
}
