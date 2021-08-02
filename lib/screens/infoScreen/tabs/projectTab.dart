import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProjectTab extends StatefulWidget {
  @override
  _ProjectTabState createState() => _ProjectTabState();
}

class _ProjectTabState extends State<ProjectTab>
    with AutomaticKeepAliveClientMixin<ProjectTab> {
  String url = "https://github.com/kesharaJayasinghe/vdev-20210801";
  WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        debuggingEnabled: true,
        userAgent: "",
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      ),
    );
  }
}
