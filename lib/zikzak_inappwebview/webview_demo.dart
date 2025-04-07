import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zikzak_inappwebview/zikzak_inappwebview.dart';

class WebViewDemo extends StatefulWidget {
  const WebViewDemo({Key? key}) : super(key: key);

  @override
  State<WebViewDemo> createState() => _WebViewDemoState();
}

class _WebViewDemoState extends State<WebViewDemo> {
  String? htmlData;
  Uint8List? imageData;

  @override
  void initState() {
    loadHtml();
    super.initState();
  }

  void loadHtml() async {
    htmlData = await rootBundle.loadString('assets/test.html');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Demo'),
      ),
      body: Column(
        children: [
          if (htmlData != null)
            SizedBox(
              width: 300,
              height: 200,
              child: InAppWebView(
                initialData: InAppWebViewInitialData(data: htmlData!),
                initialSettings: InAppWebViewSettings(
                  javaScriptEnabled: true,
                  transparentBackground: true,
                ),
                onLoadStop: (controller, url) async {
                  if (imageData == null) {
                    Future.delayed(const Duration(milliseconds: 100), () async {
                      imageData = await controller.takeScreenshot();
                      setState(() {});
                    });
                  }
                },
              ),
            ),
          const SizedBox(height: 20),
          if (imageData != null)
            Image.memory(
              imageData!,
              width: 300,
              height: 200,
            ),
        ],
      ),
    );
  }
}
