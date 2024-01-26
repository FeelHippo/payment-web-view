import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'payment_method_channel.dart';

abstract class PaymentPlatform extends PlatformInterface {
  /// Constructs a PaymentPlatform.
  PaymentPlatform() : super(token: _token);

  static final Object _token = Object();

  static PaymentPlatform _instance = MethodChannelPayment();

  /// The default instance of [PaymentPlatform] to use.
  ///
  /// Defaults to [MethodChannelPayment].
  static PaymentPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PaymentPlatform] when
  /// they register themselves.
  static set instance(PaymentPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
