import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graphic/graphic.dart';
import 'package:sleep_care/common/base/base_layout.dart';
import 'package:sleep_care/common/resource/palette.dart';
import 'package:sleep_care/common/resource/strings.dart';
import 'package:sleep_care/domain/controller/graphic_controller.dart';
import 'package:sleep_care/domain/model/graphic_model.dart';
import 'package:sleep_care/presentation/widget/default_app_bar.dart';

class GraphicLayout extends BaseLayout {
  @override
  State<StatefulWidget> createState() => _GraphicLayoutState();
}

class _GraphicLayoutState
    extends BaseLayoutState<GraphicController, GraphicLayout> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return DefaultAppBar(
      leading: Icon(
        Icons.arrow_back_ios,
      ),
      backgroundColor: Palette.mayaBlue,
    );
  }

  @override
  Widget buildLayout(BuildContext context) {
    final timeSeriesSales = [
      GraphicModel(10, 60),
      GraphicModel(15, 68),
      GraphicModel(19, 70),
      GraphicModel(30, 60),
      GraphicModel(34, 70),
      GraphicModel(40, 75),
      GraphicModel(45, 73),
      GraphicModel(55, 70),
      GraphicModel(60, 60),
      GraphicModel(78, 78),
    ];

    return Container(
      padding: EdgeInsets.all(40.0),
      margin: const EdgeInsets.only(top: 10),
      child: Chart(
        data: timeSeriesSales,
        variables: {
          Strings.age: Variable(
            accessor: (GraphicModel datum) => datum.age,
          ),
          Strings.pulse: Variable(
            accessor: (GraphicModel datum) => datum.pulse,
          ),
        },
        elements: [LineElement()],
        axes: [
          Defaults.horizontalAxis,
          Defaults.verticalAxis,
        ],
        selections: {
          'touchMove': PointSelection(
            on: {
              GestureType.scaleUpdate,
              GestureType.tapDown,
              GestureType.longPressMoveUpdate
            },
            dim: 1,
          )
        },
        tooltip: TooltipGuide(
          followPointer: [false, true],
          align: Alignment.topLeft,
          offset: const Offset(-20, -20),
        ),
        crosshair: CrosshairGuide(followPointer: [false, true]),
      ),
    );
  }
}
