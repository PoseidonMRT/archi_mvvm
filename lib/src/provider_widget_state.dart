import 'package:archi_mvvm/src/lifecycle_aware_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';

///
/// this is a base implements of which class combine ViewModel and Widgets
/// when we called notifyListeners method in class which extends from BaseViewModel
/// and T class Which extends StatefulWidget will been updated
///
abstract class ProviderWidgetState<T extends StatefulWidget,
        VM extends BaseViewModel> extends LifecycleAwareState<T>
    with AutomaticKeepAliveClientMixin {
  VM _viewModel;

  VM get viewModel => _viewModel;
  Widget _child;

  @override
  void onPageCreate() {
    super.onPageCreate();
    _viewModel = createViewModel();
    _child = createChildWidget();
  }

  @override
  Widget build(BuildContext context) {
    if (isAutomaticKeepAliveClientEnabled()) {
      super.build(context);
    }
    return ChangeNotifierProvider<VM>(
      create: (_) => _viewModel,
      child: Consumer<VM>(
        child: _child,
        builder: (context, model, child) {
          return buildWidget(context, model, child);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => isAutomaticKeepAliveClientEnabled();

  bool needShowGlobalLoadingDialog() {
    return true;
  }

  VM createViewModel();

  Widget buildWidget(BuildContext context, VM model, Widget child);

  Widget createChildWidget() {
    return null;
  }

  bool isAutomaticKeepAliveClientEnabled() {
    return false;
  }
}
