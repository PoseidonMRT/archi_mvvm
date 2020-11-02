import 'package:archi_mvvm/src/base_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

abstract class BaseViewModel<T extends BaseModel> extends ChangeNotifier {
  final BuildContext context;
  T model;

  bool loading = false;

  bool isLoadingShowing = false;

  BaseViewModel({@required this.context}) {
    model = createModel();
  }

  T createModel();
}
