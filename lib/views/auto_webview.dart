import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart';

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
      ..loadRequest(Uri.parse('https://jsonplaceholder.typicode.com/'));

    if (!kIsWeb) {
      controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seguro Automóvel')),
      body: WebViewWidget(controller: controller),
    );
  }
}
