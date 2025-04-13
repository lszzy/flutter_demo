import 'package:flutter/material.dart';
import 'package:flutter_demo/extended_nested_scroll_view/dou_yin_ping_lun.dart';
import 'package:flutter_demo/extended_nested_scroll_view/dynamic_pinned_header_height.dart';
import 'package:flutter_demo/extended_nested_scroll_view/extened_nested_scroll_view_demo.dart';
import 'package:flutter_demo/extended_nested_scroll_view/load_more.dart';
import 'package:flutter_demo/extended_nested_scroll_view/pull_to_refresh.dart';
import 'package:flutter_demo/extended_nested_scroll_view/pull_to_refresh_outer.dart';
import 'package:flutter_demo/extended_nested_scroll_view/scroll_to_top.dart';
import 'package:flutter_demo/extended_nested_scroll_view/scroll_to_top_nested.dart';
import 'package:flutter_demo/flutter_scrollview_observer/nested_scrollview_demo_page.dart';
import 'package:flutter_demo/zikzak_inappwebview/webview_demo.dart';
import 'package:flutter_demo/zikzak_inappwebview/webview_image_demo.dart';
import 'package:fwdebug_flutter/fwdebug_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      builder: (context, child) {
        return FwdebugFlutter.inspector(child: child!);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const NestedScrollViewDemoPage();
                }));
              },
              child: const Text('NestedScrollViewDemoPage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PingLunDemo();
                }));
              },
              child: const Text('PingLunDemo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TextFieldPage(text: "我是测试文本");
                }));
              },
              child: const Text('TextFieldPage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DouYinPingLunDemo();
                }));
              },
              child: const Text('DouYinPingLunDemo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoadMoreDemo();
                }));
              },
              child: const Text('LoadMoreDemo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ExtendedNestedScrollViewDemo();
                }));
              },
              child: const Text('ExtendedNestedScrollViewDemo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DynamicPinnedHeaderHeightDemo();
                }));
              },
              child: const Text('DynamicPinnedHeaderHeightDemo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PullToRefreshDemo();
                }));
              },
              child: const Text('PullToRefreshDemo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PullToRefreshOuterDemo();
                }));
              },
              child: const Text('PullToRefreshOuterDemo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ScrollToTopDemo();
                }));
              },
              child: const Text('ScrollToTopDemo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ScrollToTopNestedDemo();
                }));
              },
              child: const Text('ScrollToTopNestedDemo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WebViewDemo();
                }));
              },
              child: const Text('WebViewDemo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WebViewImageDemo();
                }));
              },
              child: const Text('WebViewImageDemo'),
            ),
          ],
        ),
      ),
    );
  }
}
