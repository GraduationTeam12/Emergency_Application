import 'package:device_info_plus/device_info_plus.dart';
import 'package:user_accident/core/cache/cache_helper.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

Future<Map<String, dynamic>> getDeviceDetails() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  // final prefs = await SharedPreferences.getInstance();

  // check if deviceId already exists
  String? storedDeviceId = CacheHelper().getData(key: 'deviceId');

  if (storedDeviceId == null) {
    // generate new UUID and store it
    storedDeviceId = const Uuid().v4();
    await CacheHelper().saveData(key: 'deviceId', value: storedDeviceId);
  }

  if (Platform.isAndroid) {
    final androidInfo = await deviceInfoPlugin.androidInfo;
    return {
      'deviceId': storedDeviceId,
      'manufacturer': androidInfo.manufacturer,
      'model': androidInfo.model,
    };
  } else if (Platform.isIOS) {
    final iosInfo = await deviceInfoPlugin.iosInfo;
    return {
      'deviceId': storedDeviceId,
      'manufacturer': 'Apple',
      'model': iosInfo.utsname.machine,
    };
  } else {
    return {
      'deviceId': storedDeviceId,
      'manufacturer': 'Unknown',
      'model': 'Unknown',
    };
  }
}