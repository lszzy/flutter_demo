import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/extended_nested_scroll_view/common.dart';
import 'package:loading_more_list/loading_more_list.dart';

class ExtendedNestedScrollViewDemo extends StatefulWidget {
  @override
  _ExtendedNestedScrollViewDemoState createState() =>
      _ExtendedNestedScrollViewDemoState();
}

class _ExtendedNestedScrollViewDemoState
    extends State<ExtendedNestedScrollViewDemo> with TickerProviderStateMixin {
  late final TabController primaryTC;
  late final TabController secondaryTC;

  @override
  void initState() {
    super.initState();
    primaryTC = TabController(length: 2, vsync: this);
    secondaryTC = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    primaryTC.dispose();
    secondaryTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildScaffoldBody());
  }

  Widget _buildScaffoldBody() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight =
        //statusBar height
        statusBarHeight +
            //pinned SliverAppBar height in header
            kToolbarHeight;
    return ExtendedNestedScrollView(
      headerSliverBuilder: (BuildContext c, bool f) {
        return buildSliverHeader();
      },
      //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
      pinnedHeaderSliverHeightBuilder: () {
        return pinnedHeaderHeight;
      },
      //2.[inner scrollables in tabview sync issue](https://github.com/flutter/flutter/issues/21868)
      onlyOneScrollInBody: true,
      // physics: NeverScrollableScrollPhysics(),
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
            tabs: const <Tab>[Tab(text: 'Tab0'), Tab(text: 'Tab1')],
          ),
          Expanded(
            child: TabBarView(
              controller: primaryTC,
              children: <Widget>[
                SecondaryTabView('Tab0', secondaryTC),
                GlowNotificationWidget(
                  ExtendedVisibilityDetector(
                    uniqueKey: const Key('Tab1'),
                    child: ListView.builder(
                      //store Page state
                      key: const PageStorageKey<String>('Tab1'),
                      physics: const ClampingScrollPhysics(),
                      itemCount: 50,
                      itemBuilder: (BuildContext c, int i) {
                        return Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          child: Text(
                            const Key('Tab1').toString() + ': ListView$i',
                          ),
                        );
                      },
                    ),
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
