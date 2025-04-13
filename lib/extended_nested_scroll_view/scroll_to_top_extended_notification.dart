import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';

class ScrollToTopExtendedNotificationDemo extends StatefulWidget {
  @override
  _ScrollToTopExtendedNotificationDemoState createState() =>
      _ScrollToTopExtendedNotificationDemoState();
}

class _ScrollToTopExtendedNotificationDemoState
    extends State<ScrollToTopExtendedNotificationDemo>
    with TickerProviderStateMixin {
  late final TabController primaryTC;
  ScrollController outerController = ScrollController();

  @override
  void initState() {
    super.initState();
    primaryTC = TabController(length: 2, vsync: this);

    outerController.addListener(() {
      print("outer: " + outerController.offset.toString());
      if (!canScroll && innerScrollOffset <= 0) {
        if (outerController.offset != 200) {
          outerController.jumpTo(200);
        }
      }
    });
  }

  void innerOffsetChanged(double offset) {
    innerScrollOffset = offset;
    print("inner: " + offset.toString());
    if (!canScroll && offset <= 0) {
      if (outerController.offset != 200) {
        outerController.jumpTo(200);
      }
    }
  }

  @override
  void dispose() {
    primaryTC.dispose();
    super.dispose();
  }

  bool canScroll = true;
  double innerScrollOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.depth <= 0) return false;

          final offset = notification.metrics.pixels;
          if (notification is ScrollStartNotification) {
            canScroll = true;
            if (notification.dragDetails != null) {
              canScroll = offset <= 0;
            }
            print("ScrollStartNotification inner: $offset canScroll: " +
                canScroll.toString());

            if (innerScrollOffset != offset) innerOffsetChanged(offset);
          } else if (notification is ScrollUpdateNotification) {
            if (innerScrollOffset != offset) innerOffsetChanged(offset);
          } else if (notification is ScrollEndNotification) {
            print("ScrollEndNotification");
            if (innerScrollOffset != offset) innerOffsetChanged(offset);
          }
          return false;
        },
        child: _buildScaffoldBody(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.file_upload),
        onPressed: () {
          ///scroll current tab list
          outerController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        },
      ),
    );
  }

  Widget _buildScaffoldBody() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight =
        //statusBar height
        statusBarHeight +
            //pinned SliverAppBar height in header
            kToolbarHeight;
    return ExtendedNestedScrollView(
      controller: outerController,
      headerSliverBuilder: (BuildContext c, bool f) {
        return <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            title: const Text('scroll to top'),
            flexibleSpace: FlexibleSpaceBar(
              //centerTitle: true,
              collapseMode: CollapseMode.pin,
              background: Image.asset('assets/467141054.jpg', fit: BoxFit.fill),
            ),
          ),
        ];
      },
      //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
      pinnedHeaderSliverHeightBuilder: () {
        return pinnedHeaderHeight;
      },
      body: Column(
        children: <Widget>[
          TabBar(
            controller: primaryTC,
            labelColor: Colors.blue,
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.0,
            isScrollable: false,
            unselectedLabelColor: Colors.grey,
            onTap: (index) {
              outerController.jumpTo(200);
            },
            tabs: const <Tab>[
              Tab(text: 'Tab0'),
              Tab(text: 'Tab1'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: primaryTC,
              children: <Widget>[
                GlowNotificationWidget(
                  ListView.builder(
                    //store Page state
                    key: const PageStorageKey<String>('Tab0'),
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (BuildContext c, int i) {
                      return Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child:
                            Text(const Key('Tab0').toString() + ': ListView$i'),
                      );
                    },
                    itemCount: 50,
                  ),
                  showGlowLeading: false,
                ),
                GlowNotificationWidget(
                  ListView.builder(
                    //store Page state
                    key: const PageStorageKey<String>('Tab1'),
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (BuildContext c, int i) {
                      return Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child:
                            Text(const Key('Tab1').toString() + ': ListView$i'),
                      );
                    },
                    itemCount: 50,
                  ),
                  showGlowLeading: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
