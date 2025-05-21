import 'package:flutter/material.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  const AnimatedOpacityDemo({super.key});

  @override
  State<AnimatedOpacityDemo> createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;

  bool _isVisible2 = false;
  double _opacity2 = 0;

  bool _isVisible3 = false;
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isVisible = true;

        _isVisible2 = true;
        _opacity2 = 1;

        _isVisible3 = true;
        _controller.forward();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedOpacity Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: AnimatedOpacity(
                opacity: _isVisible ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                GestureDetector(
                  onTap: () async {
                    if (_isVisible2) {
                      setState(() {
                        _opacity2 = 0;
                      });
                    } else {
                      setState(() {
                        _isVisible2 = true;
                        _opacity2 = 1;
                      });
                    }
                  },
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('切换'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_isVisible2) {
                      setState(() {
                        _opacity2 = 0;
                      });
                    } else {
                      setState(() {
                        _isVisible2 = true;
                        _opacity2 = 1;
                      });
                    }
                  },
                  child: Visibility(
                    visible: _isVisible2,
                    maintainState: true,
                    maintainAnimation: true,
                    child: AnimatedOpacity(
                      opacity: _opacity2,
                      onEnd: () {
                        if (_opacity2 == 0) {
                          setState(() {
                            _isVisible2 = false;
                          });
                        }
                      },
                      duration: const Duration(seconds: 1),
                      child: Container(
                        color: Colors.green,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                GestureDetector(
                  onTap: () async {
                    if (_isVisible3) {
                      await _controller.reverse();
                      setState(() {
                        _isVisible3 = false;
                      });
                    } else {
                      setState(() {
                        _isVisible3 = true;
                        _controller.forward();
                      });
                    }
                  },
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('切换'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (_isVisible3) {
                      await _controller.reverse();
                      setState(() {
                        _isVisible3 = false;
                      });
                    } else {
                      setState(() {
                        _isVisible3 = true;
                        _controller.forward();
                      });
                    }
                  },
                  child: Visibility(
                    visible: _isVisible3,
                    child: FadeTransition(
                      opacity: _animation,
                      child: Container(
                        color: Colors.green,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
