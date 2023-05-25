import 'package:flutter/material.dart';
import 'package:huskar/cores/utils/register_listener_fn.dart';

abstract class PresenterWidget<T extends Object> extends StatefulWidget {
  const PresenterWidget({super.key});

  @override
  PresenterWidgetState<T, PresenterWidget<T>> createState();
}

abstract class PresenterWidgetState<T extends Object,
    W extends PresenterWidget<T>> extends State<W> {
  @override
  @mustCallSuper
  void setState(VoidCallback fn) {
    if (!mounted) {
      return;
    }
    super.setState(fn);
  }

  /// override this method if necessary
  void Function(T state)? listener;

  void setListener(ListenerFn<T> listener);
}
