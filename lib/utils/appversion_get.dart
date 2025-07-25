import 'package:package_info_plus/package_info_plus.dart';

Future<void> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  appName = packageInfo.appName; // App name
  packageName = packageInfo.packageName; // Package name (e.g., com.example.app)
  version = packageInfo.version; // App version (e.g., 1.0.0)
  buildNumber = packageInfo.buildNumber; // Build number (e.g., 1)

}

String appName = "";
String packageName = "";
String version = "";
String buildNumber = "";