import 'package:sleep_care/common/base/base_screen.dart';
import 'package:sleep_care/core/di/dependency_provider.dart';
import 'package:sleep_care/domain/controller/activities_controller.dart';

import 'activities_layout.dart';

class ActivitiesScreen
    extends BaseScreen<ActivitiesController, ActivitiesLayout> {
  @override
  ActivitiesController get controller => ActivitiesController(get(), get());

  @override
  ActivitiesLayout get layout => ActivitiesLayout();
}
