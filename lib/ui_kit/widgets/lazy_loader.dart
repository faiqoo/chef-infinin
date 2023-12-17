import 'package:flutter/cupertino.dart';

import 'package:chef/ui_kit/widgets/general_loading.dart';

enum LoadingStatus {
  loading,
  stable,
}

class LazyLoader extends StatefulWidget {
  const LazyLoader({
    required Widget child,
    required Function(int) onEndOfPage,
    Axis scrollDirection = Axis.vertical,
    Key? key,
  })  : _child = child,
        _onEndOfPage = onEndOfPage,
        _scrollDirection = scrollDirection,
        super(key: key);

  final Widget _child;
  final Function(int) _onEndOfPage;
  final Axis _scrollDirection;

  @override
  State<LazyLoader> createState() => _LazyLoaderState();
}

class _LazyLoaderState extends State<LazyLoader> {
  var loadMoreStatus = LoadingStatus.stable;
  var page = 2;
  var isLoading = false;
  @override
  void didUpdateWidget(LazyLoader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!isLoading) {
      loadMoreStatus = LoadingStatus.stable;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: NotificationListener<ScrollNotification>(
            child: widget._child,
            onNotification: (notification) => _onNotification(
              notification: notification,
              context: context,
            ),
          ),
        ),
        if (isLoading) const GeneralLoading(isLazyLoader: true)
      ],
    );
  }

  bool _onNotification({
    required ScrollNotification notification,
    required BuildContext context,
  }) {
    if (widget._scrollDirection == notification.metrics.axis) {
      if (notification is ScrollUpdateNotification) {
        if (notification.metrics.maxScrollExtent ==
            notification.metrics.pixels) {
          _loadMore();
        }
        return true;
      }
      if (notification is ScrollEndNotification) {
        _loadMore();
        return true;
      }
      if (notification is OverscrollNotification) {
        if (notification.overscroll > 0) {
          _loadMore();
        }
        return true;
      }
    }
    return false;
  }

  void _loadMore() async {
    if (loadMoreStatus == LoadingStatus.stable) {
      loadMoreStatus = LoadingStatus.loading;
      setState(() {
        isLoading = true;
      });
      await widget._onEndOfPage(page);
      setState(() {
        isLoading = false;
      });
      page++;
    }
  }
}
