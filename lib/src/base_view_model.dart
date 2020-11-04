import 'package:archi_mvvm/src/base_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

///
/// ViewModel class which extends from ChangeNotifier class
///
/// this class will maintain an object which implements BaseModel class
///
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
