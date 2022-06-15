import 'package:flutter/foundation.dart';
import 'dart:collection';

class Data extends ChangeNotifier {
  List<bool> _isChecked = [];
  List<String> _texts = [];

  Data() {
    // Add some initial data
    addToList('Task 1');
    addToList('Task 2');
    addToList('Task 3');
  }

  void addToList(String text) {
    _texts.add(text);
    _isChecked.add(false);
    notifyListeners();
  }

  void removeFromList(int index) {
    _texts.removeAt(index);
    _isChecked.removeAt(index);
    notifyListeners();
  }

  void onCheckboxChanged(int index, bool? val) {
    _isChecked[index] = val as bool;
    notifyListeners();
  }

  int get taskCount {
    return _texts.length;
  }

  UnmodifiableListView<String> get texts {
    return UnmodifiableListView(_texts);
  }

  UnmodifiableListView<bool> get isChecked {
    return UnmodifiableListView(_isChecked);
  }
}
