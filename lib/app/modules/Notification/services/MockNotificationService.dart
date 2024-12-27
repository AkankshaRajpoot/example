import '../../../models/ApiResponse.dart';
import 'NotificationService.dart';

class MockNotificationService implements NotificationService {
  /// Start the server request
  @override
  void init() => null;

  /// Stop the server request
  @override
  void close() => null;

  @override
  Future<ApiResponse> index() {
    throw UnimplementedError();
  }
}
