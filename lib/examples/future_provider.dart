import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deviceInfoProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final deviceInfo = await deviceInfoPlugin.deviceInfo;
  final allInfo = deviceInfo.data;
  return allInfo;
});

class DeviceInfo extends ConsumerWidget {
  const DeviceInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Map<String, dynamic>> config = ref.watch(deviceInfoProvider);

    return switch (config) {
      AsyncData(:final value) => Text(value["id"]),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const CircularProgressIndicator(),
    };
  }
}
