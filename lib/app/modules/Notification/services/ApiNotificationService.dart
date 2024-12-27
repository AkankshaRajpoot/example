import '../../../helpers/Request.dart';
import '../../../models/ApiResponse.dart';
import 'NotificationService.dart';

class ApiNotificationService implements NotificationService {
  /// Start the server request
  @override
  void init() => Request.start();

  /// Stop the server request
  @override
  void close() => Request.close();

  @override
  Future<ApiResponse> index() async {
    return await Request.get('/notifications', authenticate: true);
  }
}
