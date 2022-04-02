import 'package:get/get.dart';

import 'ban.dart';
import 'eng.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': eng,
        'bn_BD': ban,
      };
}
