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
  final int delay = 200;
  final double opacity = 0.01;

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(imageData != null
                ? '3. Image loaded'
                : (htmlData != null ? '2. WebView loaded' : '1. Loading...')),
            const SizedBox(height: 20),
            imageData != null
                ? _buildImage()
                : (htmlData != null ? _buildWebView() : _buildPlaceholder())
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return const SizedBox(
      width: 300,
      height: 200,
    );
  }

  Widget _buildWebView() {
    return Opacity(
      opacity: opacity,
      child: SizedBox(
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
              Future.delayed(Duration(milliseconds: delay), () async {
                imageData = await controller.takeScreenshot();
                setState(() {});
              });
            }
          },
        ),
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
