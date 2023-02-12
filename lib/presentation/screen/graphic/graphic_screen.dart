import 'package:sleep_care/common/base/base_screen.dart';
import 'package:sleep_care/domain/controller/graphic_controller.dart';
import 'package:sleep_care/presentation/screen/graphic/graphic_layout.dart';

class GraphicScreen extends BaseScreen<GraphicController, GraphicLayout> {
  @override
  GraphicController get controller => GraphicController();

  @override
  GraphicLayout get layout => GraphicLayout();
}
