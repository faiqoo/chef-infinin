import 'package:flutter/widgets.dart';

enum ScrollEdge {
  start,
  end,
}

class ScrollEdgeListener extends StatefulWidget {
  const ScrollEdgeListener({
    required this.listener,
    required this.child,
    this.edge = ScrollEdge.end,
    this.edgeOffset = 0,
    this.continuous = false,
    this.debounce = Duration.zero,
    this.dispatch = true,
    Key? key,
  }) : super(key: key);

  /// Called continuously when the scroll position is between the [edgeOffset]
  /// and the edge.
  final Function(int) listener;

  /// The child widget which should contain a scroll widget.
  final Widget child;

  /// Determines on which edge the [listener] will be called.
  ///
  /// Defaults to [ScrollEdge.end].
  final ScrollEdge edge;

  /// The offset from the specified edge.
  ///
  /// Defaults to 0.0.
  final double edgeOffset;

  /// If true, the [listener] will be called continuously. If false, the
  /// [listener] will be called once whenever it is between the [offset] and
  /// the [edge].
  ///
  /// Defaults to false.
  final bool continuous;

  /// The debounce time for the [listener].
  ///
  /// Defaults to [Duration.zero].
  final Duration debounce;

  /// Whether the scroll notification should propagate to the ancestor widgets.
  ///
  /// Defaults to true.
  final bool dispatch;

  @override
  State<ScrollEdgeListener> createState() => _ScrollEdgeListenerState();
}

class _ScrollEdgeListenerState extends State<ScrollEdgeListener> {
  var _wasBetweenOffsetAndEdge = true;
  var _lastTimeListenerCall = DateTime.fromMillisecondsSinceEpoch(0);
  var page = 1;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final bool betweenOffsetAndEdge;

        final metrics = notification.metrics;
        switch (widget.edge) {
          case ScrollEdge.start:
            betweenOffsetAndEdge =
                metrics.pixels <= metrics.minScrollExtent + widget.edgeOffset;
            break;
          case ScrollEdge.end:
            betweenOffsetAndEdge =
                metrics.pixels >= metrics.maxScrollExtent - widget.edgeOffset;
            break;
          default:
            throw UnimplementedError();
        }

        if (widget.continuous ||
            (!_wasBetweenOffsetAndEdge && betweenOffsetAndEdge)) {
          if (_lastTimeListenerCall
              .add(widget.debounce)
              .isAfter(DateTime.now())) {
            return widget.dispatch;
          }

          widget.listener(page);
          _lastTimeListenerCall = DateTime.now();
          page++;
        }

        _wasBetweenOffsetAndEdge = betweenOffsetAndEdge;

        return widget.dispatch;
      },
      child: widget.child,
    );
  }
}
