import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'model/user.dart';

class StoreData extends GetxController {
  final box = GetStorage();
  Future<void> initStorage() async {
    await GetStorage.init();
  }

  void storeData(User user) {
    box.write('key', user.toMap());
  }

  User readData() {
    final map = box.read('key') ?? {};
    return User.fromMap(map);
  }
}
