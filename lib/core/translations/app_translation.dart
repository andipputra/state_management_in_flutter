import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'id_ID': {'hello_world': 'hai guys'},
    'en_EN': {'hello_world': 'hai guys in english'},
  };
}
