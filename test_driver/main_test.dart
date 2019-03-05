// This is a basic Flutter Driver test for the application. A Flutter Driver
// test is an end-to-end test that "drives" your application from another
// process or even from another computer. If you are familiar with
// Selenium/WebDriver for web, Espresso for Android or UI Automation for iOS,
// this is simply Flutter's version of that.

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('end-to-end test', () {
    final timeout = Duration(seconds: 20);
    FlutterDriver driver;

    setUpAll(() async {
      // Connect to a running Flutter application instance.
//      driver = await FlutterDriver.connect(timeoutMultiplier: 4);
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) driver.close();
    });

    test('tap on the floating action button; verify counter', () async {
      // Finds the floating action button (fab) to tap on
      SerializableFinder fab = find.byTooltip('Increment');

      // Wait for the floating action button to appear
      await driver.waitFor(fab, timeout: timeout);

      // Tap on the fab
      await driver.tap(fab, timeout: timeout);

      // Wait for text to change to the desired value
      await driver.waitFor(find.text('1'), timeout: timeout);
    });
  });
}
