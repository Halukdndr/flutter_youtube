import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../pages/home_page.dart';

class InitialStateOfApp extends GivenWithWorld<FlutterWorld> {
  InitialStateOfApp()
      : super(StepDefinitionConfiguration()..timeout = const Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    //Instantiate homepage with world.driver as parameter for flutter driver object
    HomePage homePage = HomePage(await FlutterDriver.connect());

    expectMatch(await homePage.getCounterValue(), "0");
  }

  @override
  RegExp get pattern => RegExp(r"I test the initial state of the app");
}