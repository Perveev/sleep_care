import 'package:sleep_care/common/base/base_screen.dart';
import 'package:sleep_care/core/di/dependency_provider.dart';
import 'package:sleep_care/domain/controller/age_category_controller.dart';

import 'age_category_layout.dart';

class AgeCategoryScreen
    extends BaseScreen<AgeCategoryController, AgeCategoryLayout> {
  AgeCategoryScreen();

  @override
  AgeCategoryController get controller => AgeCategoryController(get(), get());

  @override
  AgeCategoryLayout get layout => AgeCategoryLayout();
}
