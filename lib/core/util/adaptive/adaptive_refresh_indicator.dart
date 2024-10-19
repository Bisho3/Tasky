import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveRefresh extends StatelessWidget {
  const AdaptiveRefresh(
      {super.key,
      required this.oS,
      required this.onRefresh,
      required this.keyRefresh,
      required this.child});

  final String oS;
  final Widget child;
  final Future Function() onRefresh;
  final GlobalKey<RefreshIndicatorState> keyRefresh;

  @override
  Widget build(BuildContext context) {
    if (oS == 'android') {
      return RefreshIndicator(
        onRefresh: onRefresh,
        key: key,
        child: child,
      );
    } else {
      return CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: onRefresh,
            key: key,
          ),
          SliverToBoxAdapter(
            child: child,
          ),
        ],
      );
    }
  }
}
