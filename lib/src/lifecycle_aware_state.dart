import 'package:flutter/cupertino.dart';

abstract class LifecycleAwareState<T extends StatefulWidget> extends State<T>
    with RouteAware, WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    onPageCreate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getRouteObserver().subscribe(this, ModalRoute.of(context));
  }

  @override
  void didPopNext() {
    super.didPopNext();
    onPageResume();
  }

  @override
  void didPush() {
    super.didPush();
    onPageStart();
  }

  @override
  void didPushNext() {
    super.didPushNext();
    onPagePaused();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onPageResume();
    } else if (state == AppLifecycleState.paused) {
      onPagePaused();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    getRouteObserver().unsubscribe(this);
    super.dispose();
  }

  RouteObserver<PageRoute> getRouteObserver();

  void onPageCreate() {}

  void onPageStart() {}

  void onPageResume() {}

  void onPagePaused() {}
}
