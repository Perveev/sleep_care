import 'package:flutter/material.dart';
import 'package:sleep_care/common/base/base_layout.dart';
import 'package:sleep_care/common/resource/drawables.dart';
import 'package:sleep_care/common/resource/styles.dart';
import 'package:sleep_care/domain/controller/rating_controller.dart';

class RatingLayout extends BaseLayout {
  @override
  State<StatefulWidget> createState() => _RatingLayoutState();
}

class _RatingLayoutState
    extends BaseLayoutState<RatingController, RatingLayout> {
  @override
  Widget buildLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Text(
                    'Оставьте оценку и коментарий, чтобы\nпомочь нам стать лучше!',
                    style: Styles.s32CobaltW500,
                  )
                ],
              ),
              SizedBox(
                width: 130.0,
              ),
              Drawables.getImage(Drawables.logo)
            ],
          )
        ],
      ),
    );
  }
}
