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
    loadHtml('Hello World');
    super.initState();
  }

  void loadHtml(String content) async {
    htmlData = (await rootBundle.loadString('assets/test.html'))
        .replaceAll('{{CONTENT}}', content);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            if (htmlData != null) _buildWebView(),
            const SizedBox(height: 20),
            if (imageData != null) _buildImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildWebView() {
    return SizedBox(
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
            Future.delayed(const Duration(milliseconds: 200), () async {
              imageData = await controller.takeScreenshot();
              setState(() {});
            });
          }
        },
        onConsoleMessage: (controller, consoleMessage) {
          print('onConsoleMessage: ${consoleMessage.message}');
        },
      ),
    );
  }

  Widget _buildImage() {
    return Image.memory(
      imageData!,
      width: 300,
      height: 200,
    );
  }
}
