import 'package:archi_mvvm/archi_mvvm.dart';
import 'package:flutter/material.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ProviderWidgetState<MyHomePage,HomeViewModel> {

  @override
  Widget buildWidget(BuildContext context, HomeViewModel model, Widget child) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${model.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          model.incrementCounter();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  HomeViewModel createViewModel() {
    return HomeViewModel();
  }

  @override
  RouteObserver<PageRoute> getRouteObserver() {
    return routeObserver;
  }
}


class HomeViewModel extends BaseViewModel<HomeModel>{
  int counter = 0;

  @override
  HomeModel createModel() {
    return HomeModel();
  }

  void incrementCounter(){
    counter ++;
    model.saveCounter(counter);
    notifyListeners();
  }
}

class HomeModel extends BaseModel {
  int _counter;

  void saveCounter(int count) {
      _counter = count;
  }
}