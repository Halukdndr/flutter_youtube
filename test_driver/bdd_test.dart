import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/initial_state_of_app.dart';


Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/add_subtract.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ] // you can include the "StdoutReporter()" without the message level parameter for verbose log information
    ..stepDefinitions = [InitialStateOfApp()]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/bdd.dart";
   // ..exitAfterTestRun = true
   // ..driverConfiguration = DriverConfiguration(
    //  find.byType('YourAppRootWidgetType'),
      // Replace with your app's root widget type
     // flutterDriverServiceUrl: 'http://localhost:4444/wd/hub', // Specify the chromedriver URL
   // );

  // ..tagExpression = "@smoke" // uncomment to see an example of running scenarios based on tag expressions

   // ..exitAfterTestRun = false; // set to false if debugging to exit cleanly
  return GherkinRunner().execute(config);
}