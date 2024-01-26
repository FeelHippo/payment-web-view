import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'payment_platform_interface.dart';

/// An implementation of [PaymentPlatform] that uses method channels.
class MethodChannelPayment extends PaymentPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('payment');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
