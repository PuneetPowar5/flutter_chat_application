import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DashboardWebView extends StatefulWidget {
  const DashboardWebView({super.key});

  @override
  State<DashboardWebView> createState() => _DashboardWebViewState();
}

class _DashboardWebViewState extends State<DashboardWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    String url;

    if (Platform.isAndroid) {
      url = "http://10.0.2.2:4200";
    } else if (Platform.isIOS) {
      url = "http://localhost:4200";
    } else {
      // Default fallback
      url = "http://localhost:4200";
    }

    // Initialize controller here — AFTER super.initState()
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Internal Dashboard")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
