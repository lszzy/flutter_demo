import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/flutter_mobx/clickable.dart';
import 'package:flutter_demo/flutter_mobx/counter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class FlutterMobxDemo extends StatefulWidget {
  const FlutterMobxDemo({super.key});

  @override
  State<StatefulWidget> createState() => _FlutterMobxDemoState();
}

class _FlutterMobxDemoState extends State<FlutterMobxDemo> {
  final counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter MobX Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            Observer(builder: (context) {
              return Container(
                color: randomColor(),
                child: Text('first: ${counter.count.value}'),
              );
            }),
            const SizedBox(height: 16),
            Clickable(
              onTap: () {
                runInAction(() {
                  counter.count.value += 1;
                });
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16),
            Observer(builder: (context) {
              return Container(
                color: randomColor(),
                child: Text('second: ${counter.another}'),
              );
            }),
            const SizedBox(height: 16),
            Clickable(
              onTap: () {
                counter.incrementAnother();
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16),
            Observer(builder: (context) {
              return Container(
                color: randomColor(),
                child: Text('total: ${counter.total}'),
              );
            }),
            const SizedBox(height: 16),
            Clickable(
              onTap: () {
                runInAction(() {
                  counter.incrementAnother();
                  counter.count.value += 1;
                });
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

  Color randomColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
  }
}
