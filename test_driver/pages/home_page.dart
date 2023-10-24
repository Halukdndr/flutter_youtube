import 'package:flutter_driver/flutter_driver.dart';

class HomePage {

  final counterTextFinder = find.byValueKey('counter');
  final buttonFinder = find.byTooltip('increment');

  late FlutterDriver _driver;

  HomePage(FlutterDriver driver){
    _driver = driver;
  }

  Future<String> getCounterValue() async {
    return await _driver.getText(counterTextFinder);
  }
}