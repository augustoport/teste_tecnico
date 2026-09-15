import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AutomobileWebViewPage extends StatefulWidget {
  const AutomobileWebViewPage({super.key});

  @override
  State<AutomobileWebViewPage> createState() => _AutomobileWebViewPageState();
}

class _AutomobileWebViewPageState extends State<AutomobileWebViewPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://jsonplaceholder.typicode.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seguro Automóvel')),
      body: WebViewWidget(controller: controller),
    );
  }
}
