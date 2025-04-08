import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zikzak_inappwebview/zikzak_inappwebview.dart';

class WebViewImageDemo extends StatefulWidget {
  const WebViewImageDemo({Key? key}) : super(key: key);

  @override
  State<WebViewImageDemo> createState() => _WebViewImageDemoState();
}

class _WebViewImageDemoState extends State<WebViewImageDemo> {
  String? htmlData;
  Uint8List? imageData;
  List<Uint8List> imageDatas = [];

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  (htmlData != null ? _buildWebView() : _buildPlaceholder()),
                  if (imageData != null) _buildImage(imageData!),
                ],
              ),
              const SizedBox(height: 20),
              ...imageDatas.map((imageData) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: _buildImage(imageData),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return const SizedBox(
      width: 300,
      height: 200,
      child: Center(
        child: Text('Loading...'),
      ),
    );
  }

  Widget _buildWebView() {
    return Opacity(
      opacity: 0.01,
      child: SizedBox(
        width: 300,
        height: 200,
        child: InAppWebView(
          initialData: InAppWebViewInitialData(
              data: htmlData!.replaceAll('{{CONTENT}}', 'Hello World')),
          initialSettings: InAppWebViewSettings(
            javaScriptEnabled: true,
            transparentBackground: true,
          ),
          onLoadStop: (controller, url) async {
            if (imageData == null) {
              Future.delayed(const Duration(milliseconds: 200), () async {
                imageData = await controller.takeScreenshot();
                setState(() {});

                controller.loadData(
                    data: htmlData!.replaceAll(
                        '{{CONTENT}}', 'Hello World ${imageDatas.length + 1}'));
              });
            } else if (imageDatas.length < 5) {
              Future.delayed(const Duration(milliseconds: 200), () async {
                Uint8List? newImageData = await controller.takeScreenshot();
                if (newImageData != null) {
                  imageDatas.add(newImageData);
                  setState(() {});

                  if (imageDatas.length < 5) {
                    controller.loadData(
                        data: htmlData!.replaceAll('{{CONTENT}}',
                            'Hello World ${imageDatas.length + 1}'));
                  }
                }
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildImage(Uint8List imageData) {
    return Image.memory(
      imageData,
      width: 300,
      height: 200,
    );
  }
}
