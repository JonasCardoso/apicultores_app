import 'dart:developer';

import 'package:flutter/material.dart';

class AppLifecyclePage extends StatefulWidget {
  const AppLifecyclePage(
      {super.key,
      required this.child,
      this.onDetached,
      this.onResumed,
      this.onInactive,
      this.onHidden,
      this.onPaused});
  final VoidCallback? onDetached;
  final VoidCallback? onResumed;
  final VoidCallback? onInactive;
  final VoidCallback? onHidden;
  final VoidCallback? onPaused;
  final Widget child;
  @override
  State<AppLifecyclePage> createState() => _AppLifecyclePageState();
}

class _AppLifecyclePageState extends State<AppLifecyclePage> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();

    // Initialize the AppLifecycleListener class and pass callbacks
    _listener = AppLifecycleListener(
      onStateChange: _onStateChanged,
    );
  }

  @override
  void dispose() {
    // Do not forget to dispose the listener
    _listener.dispose();

    super.dispose();
  }

  // Listen to the app lifecycle state changes
  void _onStateChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        _onDetached();
      case AppLifecycleState.resumed:
        _onResumed();
      case AppLifecycleState.inactive:
        _onInactive();
      case AppLifecycleState.hidden:
        _onHidden();
      case AppLifecycleState.paused:
        _onPaused();
    }
  }

  void _onDetached() {
    log('detached');
    widget.onDetached?.call();
  }

  void _onResumed() {
    log('resumed');
    widget.onResumed?.call();
  }

  void _onInactive() {
    log('inactive');
    widget.onInactive?.call();
  }

  void _onHidden() {
    log('hidden');
    widget.onHidden?.call();
  }

  void _onPaused() {
    log('paused');
    widget.onPaused?.call();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
