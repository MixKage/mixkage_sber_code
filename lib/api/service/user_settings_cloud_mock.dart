import 'package:mixkage_sber_code/api/data/user.dart';
import 'package:mixkage_sber_code/api/service/user_settings_cloud_interface.dart';

class InternetServiceMock implements InternetService {
  InternetServiceMock();

  @override
  Future<void> updateEmailSettings({String? newEmail, bool? newValue}) async {
    Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  Future<void> updatePushSettings({required bool newValue}) async {
    Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  Future<void> updateSmsSettings({String? newPhone, bool? newValue}) async {
    Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  Future<void> updateUserName({required String newName}) async {
    Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  Future<User> getUserById({required int userId}) {
    return Future.value(User.defaultConstructor());
  }
}
