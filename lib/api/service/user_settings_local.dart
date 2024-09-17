import 'package:mixkage_sber_code/api/data/user.dart';
import 'package:mixkage_sber_code/api/service/user_settings_cloud_interface.dart';
import 'package:mixkage_sber_code/common/log/logger.dart';
import 'package:mixkage_sber_code/common/persistence/secure_storage/secure_storage.dart';
import 'package:mixkage_sber_code/common/persistence/secure_storage/ss_keys.dart';

class InternetServiceLocal implements InternetService {
  final SecureStorage _sstorage;

  InternetServiceLocal(this._sstorage);

  @override
  Future<User> getUserById({required int userId}) async {
    try {
      return User.fromJson(
          (await _sstorage.getMap(key: '${SSKeys.user.keyName}/$userId'))!);
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateEmailSettings({String? newEmail, bool? newValue}) async {
    try {
      int userId =
          int.parse((await _sstorage.get(key: SSKeys.userId.keyName))!);

      final User user = await getUserById(userId: userId);

      await _sstorage.addMap(
        key: '${SSKeys.user.keyName}/$userId',
        data: user
            .copyWith(
                notificationSettings: user.notificationSettings.copyWith(
                    email: user.notificationSettings.email
                        .copyWith(address: newEmail, enabled: newValue)))
            .toJson(),
      );
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> updatePushSettings({required bool newValue}) async {
    try {
      int userId =
          int.parse((await _sstorage.get(key: SSKeys.userId.keyName))!);

      final User user = await getUserById(userId: userId);

      await _sstorage.addMap(
        key: '${SSKeys.user.keyName}/$userId',
        data: user
            .copyWith(
                notificationSettings: user.notificationSettings.copyWith(
                    push: user.notificationSettings.push
                        .copyWith(enabled: newValue)))
            .toJson(),
      );
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateSmsSettings({String? newPhone, bool? newValue}) async {
    try {
      int userId =
          int.parse((await _sstorage.get(key: SSKeys.userId.keyName))!);

      final User user = await getUserById(userId: userId);

      await _sstorage.addMap(
        key: '${SSKeys.user.keyName}/$userId',
        data: user
            .copyWith(
                notificationSettings: user.notificationSettings.copyWith(
                    sms: user.notificationSettings.sms
                        .copyWith(number: newPhone, enabled: newValue)))
            .toJson(),
      );
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateUserName({required String newName}) async {
    try {
      int userId =
          int.parse((await _sstorage.get(key: SSKeys.userId.keyName))!);

      final user = await getUserById(userId: userId);

      await _sstorage.addMap(
        key: '${SSKeys.user.keyName}/$userId',
        data: user.copyWith(name: newName).toJson(),
      );
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  Future<void> updateAllUser({required User newUser}) async {
    try {
      int userId =
          int.parse((await _sstorage.get(key: SSKeys.userId.keyName))!);

      await _sstorage.addMap(
        key: '${SSKeys.user.keyName}/$userId',
        data: newUser.toJson(),
      );
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }
}
