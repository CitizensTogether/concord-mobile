import 'package:stacked/stacked.dart';

/// Data used to provide home screen functionality.
class HomeViewModel extends BaseViewModel {
  String _title = 'Aloha!';

  String get title => '$_title $_counter';

  int _counter = 0;

  int get counter => _counter;

  void updateCounter() {
    _counter++;
    notifyListeners();
  }
}
