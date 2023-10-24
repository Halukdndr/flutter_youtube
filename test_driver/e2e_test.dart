import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

//flutter drive --driver=test_driver/e2e_test.dart --target=test_driver/e2e.dart -d web-server --no-headless --web-port=3000

void main() {
  group('Counter App', () {
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byTooltip('increment');

    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {

        driver.close();

    });
    test('starts at 0', () async {
      expect(await driver.getText(counterTextFinder), "0");
    });
    test('validates the text', () async {
      expect(await driver.getText(find.text("You have pushed the button this many times:")), "You have pushed the button this many times:");
    });
    test('increments the counter', () async {
      for (int i = 0; i < 10; i++) {
        await driver.tap(buttonFinder);
      }
      //await Future.delayed(const Duration(seconds: 10));
      expect(await driver.getText(counterTextFinder), "10");
    });
  });
}
